import 'package:flutter/material.dart';

void main() => runApp(const MovieApp());

// ---------- Colors ----------
const kBg = Color(0xFF0E0E12);
const kCard = Color(0xFF1C1C24);
const kAccent = Color(0xFFFF4D6D);

// ---------- Data ----------
class Movie {
  final String title, genre, duration, poster, about;
  final int year;
  final double rating;
  const Movie(this.title, this.year, this.rating, this.genre, this.duration,
      this.poster, this.about);
}

const List<Movie> movies = [
  Movie('The Dark Knight', 2008, 9.0, 'Action • Crime', '2h 32m',
      '/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
      'Batman faces the Joker, a criminal mastermind who wants to push Gotham into chaos.'),
  Movie('Inception', 2010, 8.8, 'Sci-Fi • Thriller', '2h 28m',
      '/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg',
      'A thief who steals secrets from dreams is given a chance to plant an idea instead.'),
  Movie('Interstellar', 2014, 8.7, 'Sci-Fi • Drama', '2h 49m',
      '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
      'Explorers travel through a wormhole in space to find a new home for humanity.'),
  Movie('Oppenheimer', 2023, 8.3, 'Biography • Drama', '3h 00m',
      '/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
      'The story of the scientist who led the creation of the first atomic bomb.'),
  Movie('Joker', 2019, 8.4, 'Crime • Drama', '2h 02m',
      '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg',
      'A struggling comedian slowly turns into the infamous clown prince of crime.'),
  Movie('Avengers: Endgame', 2019, 8.4, 'Action • Sci-Fi', '3h 01m',
      '/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
      'The Avengers assemble one last time to undo the damage done by Thanos.'),
  Movie('Avengers: Infinity War', 2018, 8.4, 'Action • Sci-Fi', '2h 29m',
      '/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg',
      'Earth\'s heroes try to stop Thanos from collecting all the Infinity Stones.'),
  Movie('Whiplash', 2014, 8.5, 'Drama • Music', '1h 46m',
      '/7fn624j5lj3xTme2SgiLCeuedmO.jpg',
      'A young drummer is pushed to his limits by an intense and ruthless teacher.'),
  Movie('The Departed', 2006, 8.5, 'Crime • Thriller', '2h 31m',
      '/nT97ifVT2J1yMQmeq20Qblg61T.jpg',
      'An undercover cop and a mole in the police force try to expose each other.'),
  Movie('Django Unchained', 2012, 8.5, 'Western • Drama', '2h 45m',
      '/7oWY8VDWW7thTzWh3OKYRkWUlD5.jpg',
      'A freed slave teams up with a bounty hunter to rescue his wife.'),
  Movie('Spider-Man: Into the Spider-Verse', 2018, 8.4, 'Animation • Action',
      '1h 57m', '/iiZZdoQBEYBv6id8su7ImL0oCbD.jpg',
      'Miles Morales becomes Spider-Man and meets heroes from other worlds.'),
  Movie('Dune', 2021, 8.0, 'Sci-Fi • Adventure', '2h 35m',
      '/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
      'A young noble must protect a dangerous desert planet and its precious spice.'),
  Movie('Mad Max: Fury Road', 2015, 8.1, 'Action • Adventure', '2h 00m',
      '/8tZYtuWezp8JbcsvHYO0O46tFbo.jpg',
      'In a desert wasteland, a rebel and a drifter race to escape a tyrant.'),
  Movie('The Social Network', 2010, 7.8, 'Drama • Biography', '2h 00m',
      '/n0ybibhJtQ5icDqTp8eRytcIHJx.jpg',
      'The story of how Facebook was created and the fights that followed.'),
  Movie('La La Land', 2016, 8.0, 'Musical • Romance', '2h 08m',
      '/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg',
      'A pianist and an actress fall in love while chasing their dreams in LA.'),
  Movie('Get Out', 2017, 7.7, 'Horror • Thriller', '1h 44m',
      '/tFXcEccSQMf3lfhfXKSU9iRBpa3.jpg',
      'A young man visits his girlfriend\'s family and discovers a disturbing secret.'),
  Movie('Everything Everywhere All at Once', 2022, 7.8, 'Sci-Fi • Comedy',
      '2h 19m', '/w3LxiVYdWWRvEVdn5RYq6jIqkb1.jpg',
      'An ordinary woman must jump between universes to save everything.'),
  Movie('Top Gun: Maverick', 2022, 8.2, 'Action • Drama', '2h 10m',
      '/62HCnUTziyWcpDaBO2i1DX17ljH.jpg',
      'After thirty years, Maverick trains a new team of pilots for a risky mission.'),
  Movie('Inglourious Basterds', 2009, 8.4, 'War • Drama', '2h 33m',
      '/7sfbEnaARXDDhKm0CZ7D7uc2sbo.jpg',
      'A group of soldiers plans to take down Nazi leaders in occupied France.'),
  Movie('The Prestige', 2006, 8.5, 'Mystery • Thriller', '2h 10m',
      '/tRNlZbgNCNOpLpbPEz5L8G8A0JN.jpg',
      'Two rival magicians fight to create the greatest illusion at any cost.'),
];

class Theatre {
  final String name, area;
  final List<String> times;
  const Theatre(this.name, this.area, this.times);
}

const List<Theatre> theatres = [
  Theatre('PVR Cinemas', 'City Centre Mall',
      ['10:30 AM', '01:45 PM', '05:00 PM', '08:15 PM']),
  Theatre('Cinepolis', 'Downtown Plaza',
      ['11:00 AM', '02:15 PM', '06:00 PM', '09:30 PM']),
  Theatre('INOX IMAX', 'Lakeside Mall',
      ['10:00 AM', '01:00 PM', '04:30 PM', '08:00 PM']),
];

// ---------- Helpers ----------
int seatPrice(int row) => row < 3 ? 180 : (row < 6 ? 250 : 350);
String seatId(int r, int c) => '${String.fromCharCode(65 + r)}${c + 1}';
bool isBooked(int r, int c) => (r * 7 + c * 3) % 5 == 0;

// ---------- App ----------
class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Showtime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: kAccent,
        scaffoldBackgroundColor: kBg,
        appBarTheme: const AppBarTheme(
          backgroundColor: kBg,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: kAccent,
            foregroundColor: Colors.white,
            minimumSize: const Size(0, 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
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

// Poster image with a fallback if the image fails to load
class Poster extends StatelessWidget {
  final Movie movie;
  const Poster(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kCard,
      child: Image.network(
        'https://image.tmdb.org/t/p/w500${movie.poster}',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stack) => Container(
          color: kCard,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label, value;
  final bool bold;
  const InfoRow(this.label, this.value, {super.key, this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white54)),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.w500,
                  fontSize: bold ? 18 : 14),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Screen 1: Home ----------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final genres = ['All', 'Action', 'Sci-Fi', 'Drama', 'Thriller', 'Crime'];
  String selected = 'All';

  @override
  Widget build(BuildContext context) {
    final list = selected == 'All'
        ? movies
        : movies.where((m) => m.genre.contains(selected)).toList();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
                  child: Text('Showtime',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: kAccent)),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 4, 16, 12),
                  child: Text('Top rated Hollywood movies of the last 20 years',
                      style: TextStyle(color: Colors.white54)),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: genres.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, i) => ChoiceChip(
                      label: Text(genres[i]),
                      selected: selected == genres[i],
                      selectedColor: kAccent,
                      backgroundColor: kCard,
                      showCheckmark: false,
                      onSelected: (_) => setState(() => selected = genres[i]),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: list.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.55,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, i) {
                      final m = list[i];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailPage(movie: m)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Poster(m),
                                    ),
                                  ),
                                  Positioned(
                                    left: 8,
                                    bottom: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.black87,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.star,
                                              color: Colors.amber, size: 14),
                                          const SizedBox(width: 3),
                                          Text('${m.rating}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(m.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(m.genre,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white54, fontSize: 12)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------- Screen 2: Movie details ----------
class DetailPage extends StatelessWidget {
  final Movie movie;
  const DetailPage({super.key, required this.movie});

  Widget pill(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
            color: kCard, borderRadius: BorderRadius.circular(20)),
        child: Text(text, style: const TextStyle(fontSize: 12)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie details')),
      body: Narrow(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Center(
                    child: SizedBox(
                      width: 220,
                      child: AspectRatio(
                        aspectRatio: 2 / 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Poster(movie),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(movie.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      pill('⭐ ${movie.rating}'),
                      pill('${movie.year}'),
                      pill(movie.duration),
                      pill(movie.genre),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('About',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(movie.about,
                      style:
                          const TextStyle(color: Colors.white70, height: 1.4)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ShowtimePage(movie: movie)),
                  ),
                  child: const Text('Book tickets'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Screen 3: Date and showtimes ----------
class ShowtimePage extends StatefulWidget {
  final Movie movie;
  const ShowtimePage({super.key, required this.movie});

  @override
  State<ShowtimePage> createState() => _ShowtimePageState();
}

class _ShowtimePageState extends State<ShowtimePage> {
  int day = 0;
  static const dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const monthNames = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final dates = List.generate(7, (i) => today.add(Duration(days: i)));
    final d = dates[day];
    final dateLabel =
        '${dayNames[d.weekday - 1]}, ${d.day} ${monthNames[d.month - 1]}';

    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.title)),
      body: Narrow(
        child: Column(
          children: [
            // Date strip
            SizedBox(
              height: 76,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 7,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, i) {
                  final date = dates[i];
                  final on = i == day;
                  return GestureDetector(
                    onTap: () => setState(() => day = i),
                    child: Container(
                      width: 58,
                      decoration: BoxDecoration(
                        color: on ? kAccent : kCard,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dayNames[date.weekday - 1],
                              style: const TextStyle(fontSize: 12)),
                          const SizedBox(height: 4),
                          Text('${date.day}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            // Theatres
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: theatres.map((t) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kCard,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(t.area,
                            style: const TextStyle(
                                color: Colors.white54, fontSize: 12)),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: t.times.map((time) {
                            return OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.green.shade400,
                                side: BorderSide(color: Colors.green.shade400),
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SeatPage(
                                    movie: widget.movie,
                                    theatre: t,
                                    date: dateLabel,
                                    time: time,
                                  ),
                                ),
                              ),
                              child: Text(time),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Screen 4: Seat selection ----------
class SeatPage extends StatefulWidget {
  final Movie movie;
  final Theatre theatre;
  final String date, time;
  const SeatPage({
    super.key,
    required this.movie,
    required this.theatre,
    required this.date,
    required this.time,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  final Set<String> selected = {};
  static const tiers = ['Classic', 'Prime', 'Recliner'];

  Widget seat(int r, int c) {
    final id = seatId(r, c);
    final booked = isBooked(r, c);
    final picked = selected.contains(id);

    return GestureDetector(
      onTap: booked
          ? null
          : () => setState(() {
                picked ? selected.remove(id) : selected.add(id);
              }),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: booked
                  ? Colors.white12
                  : (picked ? kAccent : Colors.transparent),
              border: Border.all(
                color: booked
                    ? Colors.transparent
                    : (picked ? kAccent : Colors.green.shade400),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text('${c + 1}',
                style: TextStyle(
                    fontSize: 10,
                    color: picked ? Colors.white : Colors.white54)),
          ),
        ),
      ),
    );
  }

  Widget seatRow(int r) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Text(String.fromCharCode(65 + r),
                style: const TextStyle(color: Colors.white54, fontSize: 12)),
          ),
          for (int c = 0; c < 10; c++) ...[
            if (c == 5) const SizedBox(width: 14),
            Expanded(child: seat(r, c)),
          ],
        ],
      ),
    );
  }

  Widget legend(Color fill, Color border, String label) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: fill,
            border: Border.all(color: border),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = selected.fold<int>(
        0, (sum, id) => sum + seatPrice(id.codeUnitAt(0) - 65));
    final seatList = selected.toList()..sort();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.movie.title, style: const TextStyle(fontSize: 18)),
            Text(
              '${widget.theatre.name} • ${widget.date}, ${widget.time}',
              style: const TextStyle(fontSize: 12, color: Colors.white54),
            ),
          ],
        ),
      ),
      body: Narrow(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    for (int r = 0; r < 8; r++) ...[
                      if (r == 0 || r == 3 || r == 6)
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 6),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '₹${seatPrice(r)} • ${tiers[r ~/ 3]}',
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      seatRow(r),
                    ],
                    const SizedBox(height: 24),
                    // Screen
                    Container(
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: kAccent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text('All eyes this way',
                        style: TextStyle(color: Colors.white54, fontSize: 12)),
                  ],
                ),
              ),
            ),
            // Legend
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  legend(Colors.transparent, Colors.green.shade400, 'Available'),
                  legend(kAccent, kAccent, 'Selected'),
                  legend(Colors.white12, Colors.transparent, 'Sold'),
                ],
              ),
            ),
            // Bottom bar
            Container(
              padding: const EdgeInsets.all(16),
              color: kCard,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selected.isEmpty
                              ? 'Select your seats'
                              : '${selected.length} seat(s)',
                          style: const TextStyle(color: Colors.white54),
                        ),
                        Text('₹$total',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  FilledButton(
                    onPressed: selected.isEmpty
                        ? null
                        : () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TicketPage(
                                  movie: widget.movie,
                                  theatre: widget.theatre,
                                  date: widget.date,
                                  time: widget.time,
                                  seats: seatList,
                                  total: total,
                                ),
                              ),
                            ),
                    child: const Text('Pay & Book'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------- Screen 5: Ticket ----------
class TicketPage extends StatelessWidget {
  final Movie movie;
  final Theatre theatre;
  final String date, time;
  final List<String> seats;
  final int total;

  const TicketPage({
    super.key,
    required this.movie,
    required this.theatre,
    required this.date,
    required this.time,
    required this.seats,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final bookingId = 'BK${DateTime.now().millisecondsSinceEpoch % 100000}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your ticket'),
        automaticallyImplyLeading: false,
      ),
      body: Narrow(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 56),
              const SizedBox(height: 8),
              const Text('Booking confirmed!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kCard,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Poster(movie),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movie.title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(movie.genre,
                                  style:
                                      const TextStyle(color: Colors.white54)),
                              Text(movie.duration,
                                  style:
                                      const TextStyle(color: Colors.white54)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Dotted divider
                    Row(
                      children: List.generate(
                        30,
                        (i) => Expanded(
                          child: Container(
                            height: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            color: Colors.white24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    InfoRow('Date', date),
                    InfoRow('Time', time),
                    InfoRow('Theatre', '${theatre.name}, ${theatre.area}'),
                    InfoRow('Seats', seats.join(', ')),
                    InfoRow('Booking ID', bookingId),
                    const Divider(height: 28, color: Colors.white24),
                    InfoRow('Total paid', '₹$total', bold: true),
                    const SizedBox(height: 16),
                    // Fake barcode
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        40,
                        (i) => Container(
                          width: (i % 3 + 1).toDouble(),
                          height: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () =>
                      Navigator.popUntil(context, (route) => route.isFirst),
                  child: const Text('Back to home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
