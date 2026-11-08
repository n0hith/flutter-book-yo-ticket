import 'package:flutter/material.dart';

void main() => runApp(const MovieApp());

// ---------- Letterboxd-style colors ----------
const kBg = Color(0xFF14181C);
const kCard = Color(0xFF1F252B);
const kText = Color(0xFF99AABB);
const kGreen = Color(0xFF00E054);
const kOrange = Color(0xFFFF8000);
const kBlue = Color(0xFF40BCF4);

// ---------- Data ----------
class Movie {
  final String title, genre, duration, poster, about;
  final int year;
  final double rating;
  const Movie(this.title, this.year, this.rating, this.genre, this.duration,
      this.poster, this.about);
}

const List<Movie> movies = [
  Movie('The Odyssey', 2026, 8.2, 'Adventure • Drama', '2h 52m',
      '/odyssey.jpg',
      'Odysseus, a Greek king, fights his way home after the Trojan War in Christopher Nolan\'s epic.'),
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
  Movie('The Shawshank Redemption', 1994, 9.3, 'Drama', '2h 22m',
      '/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
      'Two imprisoned men form a deep friendship over the years and find hope in small acts.'),
  Movie('Zodiac', 2007, 7.7, 'Crime • Thriller', '2h 37m',
      '/6YmeO4pB7XTh8P8F960O1uA14JO.jpg',
      'A cartoonist and two detectives chase the Zodiac Killer across years of dead ends.'),
  Movie('Saving Private Ryan', 1998, 8.6, 'War • Drama', '2h 49m',
      '/uqx37cS8cpHg8U35f9U5IBlrCV3.jpg',
      'A squad of soldiers goes behind enemy lines to bring one paratrooper home.'),
  Movie('Sinners', 2025, 7.5, 'Horror • Thriller', '2h 17m',
      '/sinners.jpg',
      'Twin brothers return to their hometown in the 1930s South and face a terrifying evil.'),
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
  Movie('Top Gun: Maverick', 2022, 8.2, 'Action • Drama', '2h 10m',
      '/62HCnUTziyWcpDaBO2i1DX17ljH.jpg',
      'After thirty years, Maverick trains a new team of pilots for a risky mission.'),
  Movie('Inglourious Basterds', 2009, 8.4, 'War • Drama', '2h 33m',
      '/7sfbEnaARXDDhKm0CZ7D7uc2sbo.jpg',
      'A group of soldiers plans to take down Nazi leaders in occupied France.'),
  Movie('The Prestige', 2006, 8.5, 'Mystery • Thriller', '2h 10m',
      '/tRNlZbgNCNOpLpbPEz5L8G8A0JN.jpg',
      'Two rival magicians fight to create the greatest illusion at any cost.'),
  Movie('Gladiator', 2000, 8.5, 'Action • Drama', '2h 35m',
      '/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg',
      'A betrayed Roman general becomes a gladiator and seeks revenge on the emperor.'),
  Movie('The Lord of the Rings: The Return of the King', 2003, 9.0,
      'Fantasy • Adventure', '3h 21m', '/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg',
      'The final battle for Middle-earth begins as Frodo nears Mount Doom.'),
  Movie('Fight Club', 1999, 8.8, 'Drama • Thriller', '2h 19m',
      '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
      'A bored office worker and a soap salesman start an underground fight club.'),
  Movie('Forrest Gump', 1994, 8.8, 'Drama • Romance', '2h 22m',
      '/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg',
      'A kind man with a low IQ lives through decades of American history.'),
  Movie('The Godfather', 1972, 9.2, 'Crime • Drama', '2h 55m',
      '/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
      'The aging head of a mafia family hands his empire to his reluctant son.'),
  Movie('Pulp Fiction', 1994, 8.9, 'Crime • Drama', '2h 34m',
      '/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg',
      'Hitmen, a boxer and a gangster\'s wife cross paths in four linked stories.'),
  Movie('The Matrix', 1999, 8.7, 'Sci-Fi • Action', '2h 16m',
      '/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',
      'A hacker learns that his world is a simulation and joins a rebellion.'),
];

class Theatre {
  final String name, area;
  final List<String> times;
  const Theatre(this.name, this.area, this.times);
}

const List<Theatre> theatres = [
  Theatre('Prasads PCX', 'Necklace Road, Hyderabad',
      ['10:30 AM', '01:45 PM', '05:00 PM', '08:15 PM']),
  Theatre('Allu Cinemas', 'Kokapet, Hyderabad',
      ['11:00 AM', '02:15 PM', '06:00 PM', '09:30 PM']),
  Theatre('JP Cinemas', 'Hyderabad',
      ['10:00 AM', '01:00 PM', '04:30 PM', '08:00 PM']),
  Theatre('PVR Nexus Mall', 'Kukatpally, Hyderabad',
      ['10:15 AM', '01:30 PM', '04:45 PM', '09:00 PM']),
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
      title: 'Cinebox',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: kGreen,
        scaffoldBackgroundColor: kBg,
        appBarTheme: const AppBarTheme(
          backgroundColor: kBg,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: kGreen,
            foregroundColor: Colors.black,
            minimumSize: const Size(0, 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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

// Small uppercase heading with a line under it
class SectionHeader extends StatelessWidget {
  final String text;
  const SectionHeader(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text.toUpperCase(),
            style: const TextStyle(
                color: kText,
                fontSize: 12,
                letterSpacing: 1.3,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        const Divider(height: 1, color: Colors.white24),
      ],
    );
  }
}

// Green star rating (out of 5, like Letterboxd)
class Stars extends StatelessWidget {
  final double rating;
  final double size;
  const Stars(this.rating, {super.key, this.size = 14});

  @override
  Widget build(BuildContext context) {
    final five = rating / 2;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        IconData icon = Icons.star_border;
        if (five >= i + 1) {
          icon = Icons.star;
        } else if (five >= i + 0.5) {
          icon = Icons.star_half;
        }
        return Icon(icon, size: size, color: kGreen);
      }),
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
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.white24),
      ),
      clipBehavior: Clip.antiAlias,
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
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
          Text(label, style: const TextStyle(color: kText)),
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
  final genres = [
    'All', 'Action', 'Sci-Fi', 'Drama', 'Thriller', 'Crime', 'War', 'Horror'
  ];
  String selected = 'All';

  Widget dot(Color c) => Container(
        width: 14,
        height: 14,
        margin: const EdgeInsets.only(right: 3),
        decoration: BoxDecoration(color: c, shape: BoxShape.circle),
      );

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
                // Top bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
                  child: Row(
                    children: [
                      dot(kOrange),
                      dot(kGreen),
                      dot(kBlue),
                      const SizedBox(width: 8),
                      const Text('CINEBOX',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5)),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SectionHeader('Popular films now showing'),
                ),
                // Genre tabs
                SizedBox(
                  height: 44,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: genres.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 20),
                    itemBuilder: (context, i) {
                      final on = selected == genres[i];
                      return GestureDetector(
                        onTap: () => setState(() => selected = genres[i]),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: on ? kGreen : Colors.transparent,
                                  width: 2),
                            ),
                          ),
                          child: Text(
                            genres[i],
                            style: TextStyle(
                                color: on ? Colors.white : kText,
                                fontWeight:
                                    on ? FontWeight.bold : FontWeight.normal),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: list.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
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
                              child: Tooltip(
                                message: '${m.title} (${m.year})',
                                child: Poster(m),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Stars(m.rating, size: 13),
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

// ---------- Screen 2: Film details ----------
class DetailPage extends StatelessWidget {
  final Movie movie;
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FILM', style: TextStyle(fontSize: 14, letterSpacing: 1.5))),
      body: Narrow(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 130,
                        child: AspectRatio(
                          aspectRatio: 2 / 3,
                          child: Poster(movie),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(movie.title,
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text('${movie.year}  •  ${movie.duration}',
                                style: const TextStyle(color: kText)),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Stars(movie.rating, size: 18),
                                const SizedBox(width: 8),
                                Text('${movie.rating}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(movie.genre,
                                style: const TextStyle(color: kText)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const SectionHeader('Synopsis'),
                  const SizedBox(height: 10),
                  Text(movie.about,
                      style: const TextStyle(
                          color: Color(0xFFCCD6DD), height: 1.5)),
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
                        color: on ? kGreen : kCard,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dayNames[date.weekday - 1],
                              style: TextStyle(
                                  fontSize: 12,
                                  color: on ? Colors.black : kText)),
                          const SizedBox(height: 4),
                          Text('${date.day}',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: on ? Colors.black : Colors.white)),
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
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(t.area,
                            style:
                                const TextStyle(color: kText, fontSize: 12)),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: t.times.map((time) {
                            return OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: kBlue,
                                side: const BorderSide(color: kBlue),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
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
                  : (picked ? kGreen : Colors.transparent),
              border: Border.all(
                color: booked
                    ? Colors.transparent
                    : (picked ? kGreen : kText),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text('${c + 1}',
                style: TextStyle(
                    fontSize: 10, color: picked ? Colors.black : kText)),
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
                style: const TextStyle(color: kText, fontSize: 12)),
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
        Text(label, style: const TextStyle(fontSize: 12, color: kText)),
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
              style: const TextStyle(fontSize: 12, color: kText),
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
                              '₹${seatPrice(r)} • ${tiers[r ~/ 3]}'
                                  .toUpperCase(),
                              style: const TextStyle(
                                  color: kText,
                                  letterSpacing: 1.1,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                          ),
                        ),
                      seatRow(r),
                    ],
                    const SizedBox(height: 24),
                    // Screen
                    Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: kOrange,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text('SCREEN THIS WAY',
                        style: TextStyle(
                            color: kText, fontSize: 11, letterSpacing: 1.2)),
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
                  legend(Colors.transparent, kText, 'Available'),
                  legend(kGreen, kGreen, 'Selected'),
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
                          style: const TextStyle(color: kText),
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
              const Icon(Icons.check_circle, color: kGreen, size: 56),
              const SizedBox(height: 8),
              const Text('Booking confirmed!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kCard,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 120,
                          child: Poster(movie),
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
                                  style: const TextStyle(color: kText)),
                              Text(movie.duration,
                                  style: const TextStyle(color: kText)),
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
