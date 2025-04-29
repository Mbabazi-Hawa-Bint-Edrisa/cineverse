class AppConstants {
  // API Constants
  static const String tmdbApiKey = 'f11a4ef31954020803bde4c622fb7ed'; // Corrected API key (removed extra '0')
  static const String tmdbBaseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  // Mutable app-wide variables with default values
  static String? userId; // Nullable, will be set after login
  static String language = 'en-US'; // Default language
  static String username = '';

  // ignore: prefer_typing_uninitialized_variables
  static var apikey;

  // ignore: prefer_typing_uninitialized_variables
  static var baseServerUrl; // Default empty string
}