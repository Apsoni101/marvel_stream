class NetworkConstants {
  static const String baseUrlMovies = 'https://mcuapi.up.railway.app/api/v1/';
  static const String baseUrlComics = 'https://gateway.marvel.com/v1/public';
  static const String moviesEndpoint = '/movies';
  static const String movies = 'movies';
  static const String movie = 'movie';
  static const String characters = '/characters';
  static const Duration connectTimeout = Duration(seconds: 500);
  static const Duration receiveTimeout = Duration(seconds: 500);
}
