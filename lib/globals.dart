class Globals {
  factory Globals() => _instance;

  Globals.internal();

  static final Globals _instance = Globals.internal();
  static const String baseUrl = 'https://developers.themoviedb.org/3/movies/';

}
