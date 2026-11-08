import 'package:flutter/material.dart';

void main() => runApp(const MovieApp());

// ---------- Data ----------
class Movie {
  final String title;
  final String genre;
  final String duration;
  final String time;
  final int price;
  final Color color;

  const Movie(this.title, this.genre, this.duration, this.time, this.price,
      this.color);
}

const List<Movie> movies = [
  Movie('Space Odyssey', 'Sci-Fi', '2h 15m', '6:30 PM', 200, Colors.indigo),
  Movie('Laugh Riot', 'Comedy', '1h 55m', '4:00 PM', 150, Colors.orange),
  Movie('Dark Alley', 'Thriller', '2h 05m', '9:00 PM', 220, Colors.teal),
  Movie('Love in Paris', 'Romance', '2h 20m', '7:15 PM', 180, Colors.pink),
];

// Seats that are already taken
const Set<int> bookedSeats = {3, 4, 10, 17, 22, 23};

String seatName(int i) => '${String.fromCharCode(65 + i ~/ 6)}${i % 6 + 1}';

// ---------- App ----------
class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Tickets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

// Keeps the layout neat on wide browser screens
class Narrow extends StatelessWidget {
  final Widget child;
  const Narrow({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: child,
      ),
    );
  }
}

// ---------- Screen 1: Movie list ----------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Now Showing')),
      body: Narrow(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SeatPage(movie: movie)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 110,
                      color: movie.color,
                      child: const Icon(Icons.movie,
                          color: Colors.white, size: 40),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(movie.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('${movie.genre} • ${movie.duration}'),
                          const SizedBox(height: 4),
                          Text('Show: ${movie.time}'),
                          const SizedBox(height: 4),
                          Text('₹${movie.price} per seat',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ---------- Screen 2: Seat selection ----------
class SeatPage extends StatefulWidget {
  final Movie movie;
  const SeatPage({super.key, required this.movie});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  final Set<int> selected = {};

  @override
  Widget build(BuildContext context) {
    final total = selected.length * widget.movie.price;

    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.title)),
      body: Narrow(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Screen bar
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 6),
              const Text('SCREEN', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),

              // Seats
              Expanded(
                child: GridView.count(
                  crossAxisCount: 6,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(30, (i) {
                    final isBooked = bookedSeats.contains(i);
                    final isSelected = selected.contains(i);

                    Color color = Colors.grey.shade300;
                    if (isBooked) color = Colors.grey.shade600;
                    if (isSelected) color = Colors.green;

                    return GestureDetector(
                      onTap: isBooked
                          ? null
                          : () => setState(() {
                                isSelected ? selected.remove(i) : selected.add(i);
                              }),
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          seatName(i),
                          style: TextStyle(
                            fontSize: 12,
                            color: (isBooked || isSelected)
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // Legend
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LegendDot(color: Color(0xFFE0E0E0), label: 'Available'),
                  LegendDot(color: Colors.green, label: 'Selected'),
                  LegendDot(color: Color(0xFF757575), label: 'Booked'),
                ],
              ),
              const SizedBox(height: 16),

              // Total + button
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${selected.length} seat(s)  •  ₹$total',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FilledButton(
                    onPressed: selected.isEmpty
                        ? null
                        : () {
                            final names = selected.toList()..sort();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TicketPage(
                                  movie: widget.movie,
                                  seats: names.map(seatName).toList(),
                                  total: total,
                                ),
                              ),
                            );
                          },
                    child: const Text('Book Now'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const LegendDot({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(4)),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// ---------- Screen 3: Ticket ----------
class TicketPage extends StatelessWidget {
  final Movie movie;
  final List<String> seats;
  final int total;

  const TicketPage({
    super.key,
    required this.movie,
    required this.seats,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Ticket'),
        automaticallyImplyLeading: false,
      ),
      body: Narrow(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 60),
              const SizedBox(height: 8),
              const Text('Booking Confirmed!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      color: movie.color,
                      child: Text(
                        movie.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          InfoRow('Genre', movie.genre),
                          InfoRow('Show Time', movie.time),
                          InfoRow('Seats', seats.join(', ')),
                          const Divider(height: 32),
                          InfoRow('Total Paid', '₹$total', bold: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;
  const InfoRow(this.label, this.value, {super.key, this.bold = false});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 16,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Flexible(child: Text(value, style: style)),
        ],
      ),
    );
  }
}
