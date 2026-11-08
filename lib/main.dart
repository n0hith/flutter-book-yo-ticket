import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MovieApp());

// ---------- Apple-style colors ----------
const kBg = Color(0xFF000000);
const kCard = Color(0xFF1C1C1E);
const kFill = Color(0xFF2C2C2E);
const kGray = Color(0xFF8E8E93);
const kBlue = Color(0xFF0A84FF);
const kGreen = Color(0xFF30D158);

// ---------- Data ----------
class Movie {
  final String title, genre, duration, poster, about;
  final int year;
  final double rating;
  const Movie(this.title, this.year, this.rating, this.genre, this.duration,
      this.poster, this.about);
}

// A poster can be a full link (https...) or a TMDB path (/abc.jpg)
String posterUrl(String p) =>
    p.startsWith('http') ? p : 'https://image.tmdb.org/t/p/w500$p';

const List<Movie> movies = [
  Movie('The Odyssey', 2026, 8.2, 'Adventure • Drama', '2h 52m',
      'https://m.media-amazon.com/images/M/MV5BNTcyNmJlZmQtNDUwYy00NDBjLTg1NGQtYTY2Y2UxMWM3NmI1XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
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
      'https://upload.wikimedia.org/wikipedia/en/5/5f/Sinners_%282025_film%29_poster.jpg',
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
    final slide = CupertinoPageTransitionsBuilder();
    return MaterialApp(
      title: 'Showtime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: kBlue,
        scaffoldBackgroundColor: kBg,
        // iOS-style slide between screens
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: slide,
          TargetPlatform.iOS: slide,
          TargetPlatform.macOS: slide,
          TargetPlatform.windows: slide,
          TargetPlatform.linux: slide,
          TargetPlatform.fuchsia: slide,
        }),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: kBlue,
            foregroundColor: Colors.white,
            minimumSize: const Size(0, 52),
            shape: const StadiumBorder(),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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

// Frosted-glass bar (blurs what is behind it)
class Glass extends StatelessWidget {
  final Widget child;
  const Glass({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(color: const Color(0xCC1C1C1E), child: child),
      ),
    );
  }
}

// Poster image with a fallback if the image fails to load
class Poster extends StatelessWidget {
  final Movie movie;
  final double radius;
  const Poster(this.movie, {super.key, this.radius = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(radius),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        posterUrl(movie.poster),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        // If the site blocks the image, load it a different way
        webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
        errorBuilder: (context, error, stack) => Container(
          color: kCard,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 12, color: kGray),
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
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: kGray)),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.w500,
                  fontSize: bold ? 20 : 15),
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
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text('Now Showing',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5)),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 20, 14),
                  child: Text('Pick a movie and book your seats',
                      style: TextStyle(color: kGray, fontSize: 15)),
                ),
                // Genre pills
                SizedBox(
                  height: 38,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: genres.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, i) {
                      final on = selected == genres[i];
                      return GestureDetector(
                        onTap: () => setState(() => selected = genres[i]),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: on ? Colors.white : kCard,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            genres[i],
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: on ? Colors.black : kGray),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                    itemCount: list.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 190,
                      childAspectRatio: 0.58,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 20,
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
                                  Positioned.fill(child: Poster(m)),
                                  Positioned(
                                    left: 8,
                                    bottom: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.star_rounded,
                                              color: Colors.amber, size: 14),
                                          const SizedBox(width: 3),
                                          Text('${m.rating}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(m.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14)),
                            const SizedBox(height: 2),
                            Text(m.genre,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: kGray, fontSize: 12)),
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

  Widget stat(String value, String label) => Expanded(
        child: Column(
          children: [
            Text(value,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(color: kGray, fontSize: 12)),
          ],
        ),
      );

  Widget divider() =>
      Container(width: 1, height: 28, color: Colors.white12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Stack(
        children: [
          // Soft glow at the top
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 420,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF1B2A4A), kBg],
                ),
              ),
            ),
          ),
          Narrow(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                    children: [
                      Center(
                        child: SizedBox(
                          width: 220,
                          child: AspectRatio(
                            aspectRatio: 2 / 3,
                            child: Poster(movie, radius: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(movie.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.5)),
                      const SizedBox(height: 6),
                      Text(movie.genre,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: kGray, fontSize: 15)),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: kCard,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            stat('${movie.rating}', 'RATING'),
                            divider(),
                            stat('${movie.year}', 'YEAR'),
                            divider(),
                            stat(movie.duration, 'LENGTH'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text('Synopsis',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      Text(movie.about,
                          style: const TextStyle(
                              color: Color(0xFFD1D1D6),
                              fontSize: 16,
                              height: 1.45)),
                    ],
                  ),
                ),
                Glass(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ShowtimePage(movie: movie)),
                        ),
                        child: const Text('Book Tickets'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
              height: 78,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        color: on ? Colors.white : kCard,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dayNames[date.weekday - 1],
                              style: TextStyle(
                                  fontSize: 12,
                                  color: on ? Colors.black54 : kGray)),
                          const SizedBox(height: 4),
                          Text('${date.day}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
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
                padding: const EdgeInsets.all(20),
                children: theatres.map((t) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: kCard,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.name,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 2),
                        Text(t.area,
                            style: const TextStyle(color: kGray, fontSize: 13)),
                        const SizedBox(height: 14),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: t.times.map((time) {
                            return TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kFill,
                                foregroundColor: Colors.white,
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 10),
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
        padding: const EdgeInsets.all(2.5),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: booked ? kCard : (picked ? kBlue : kFill),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(booked ? '' : '${c + 1}',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: picked ? Colors.white : kGray)),
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
                style: const TextStyle(color: kGray, fontSize: 12)),
          ),
          for (int c = 0; c < 10; c++) ...[
            if (c == 5) const SizedBox(width: 14),
            Expanded(child: seat(r, c)),
          ],
        ],
      ),
    );
  }

  Widget legend(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12, color: kGray)),
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
          children: [
            Text(widget.movie.title),
            Text(
              '${widget.theatre.name} • ${widget.date}, ${widget.time}',
              style: const TextStyle(
                  fontSize: 12, color: kGray, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      body: Narrow(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: Column(
                  children: [
                    // Screen
                    Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 36),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('SCREEN',
                        style: TextStyle(
                            color: kGray, fontSize: 11, letterSpacing: 2)),
                    const SizedBox(height: 8),
                    for (int r = 0; r < 8; r++) ...[
                      if (r == 0 || r == 3 || r == 6)
                        Padding(
                          padding: const EdgeInsets.only(top: 14, bottom: 6),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '₹${seatPrice(r)} • ${tiers[r ~/ 3]}',
                              style: const TextStyle(
                                  color: kGray,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      seatRow(r),
                    ],
                  ],
                ),
              ),
            ),
            // Legend
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  legend(kFill, 'Available'),
                  legend(kBlue, 'Selected'),
                  legend(kCard, 'Sold'),
                ],
              ),
            ),
            // Bottom bar
            Glass(
              child: Padding(
                padding: const EdgeInsets.all(16),
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
                            style: const TextStyle(color: kGray),
                          ),
                          Text('₹$total',
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w800)),
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
        title: const Text('Your Ticket'),
        automaticallyImplyLeading: false,
      ),
      body: Narrow(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(Icons.check_circle_rounded, color: kGreen, size: 60),
              const SizedBox(height: 10),
              const Text('Booking Confirmed',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kCard,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 84,
                          height: 126,
                          child: Poster(movie, radius: 12),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movie.title,
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 6),
                              Text(movie.genre,
                                  style: const TextStyle(color: kGray)),
                              Text(movie.duration,
                                  style: const TextStyle(color: kGray)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
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
                    const Divider(height: 30, color: Colors.white12),
                    InfoRow('Total paid', '₹$total', bold: true),
                    const SizedBox(height: 18),
                    // Fake barcode
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          38,
                          (i) => Container(
                            width: (i % 3 + 1).toDouble(),
                            height: 44,
                            margin: const EdgeInsets.symmetric(horizontal: 1),
                            color: Colors.black,
                          ),
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
                  child: const Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
