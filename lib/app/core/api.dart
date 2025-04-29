// lib/app/core/api.dart
import 'package:dio/dio.dart';
// import 'package:flutter_inappwebview_windows/';


import 'constants.dart'; 

class Api {
  final Dio dio = createDio();

  Api._internal();
  static final Api _singleton = Api._internal();
  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.tmdbBaseUrl, // Use AppConstants for base URL
        responseType: ResponseType.json, // Use JSON response type
      ),
    );

    // Add an interceptor to append the API key to every request
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters['api_key'] = AppConstants.tmdbApiKey; // Append API key
        return handler.next(options);
      },
    ));

    return dio;
  }

  // Example method to fetch popular movies
  Future<Response> fetchPopularMovies() async {
    try {
      final response = await dio.get('/movie/popular'); // Ensure the endpoint is correct
      return response;
    } catch (e) {
      throw Exception('Failed to load popular movies: $e');
    }
  }
}