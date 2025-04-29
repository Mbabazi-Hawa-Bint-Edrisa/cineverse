import 'package:dio/dio.dart';
import 'package:group_five/app/core/constants.dart';
import 'package:group_five/app/models/movie.dart';

class MylistService{
  static Future<List<Movie>> getMylist(String id) async {
    final dio = Dio();
    final response = await dio.get('${AppConstants.baseServerUrl}/favourites?userId=$id');

    return [
      for (final item in response.data) Movie.fromJson(item),
    ];
  }

  static Future<void> deleteMylist(int id) async {
    // final dio = Dio();
    // final response = await dio.delete('${Constants.baseServerUrl}/favourites/$id?id=int');
  }

  static Future<void> postMylist(Movie movie) async {
    final dio = Dio();
    // ignore: unused_local_variable
    final response = await dio.post(
        '${AppConstants.baseServerUrl}/favourites',
        data: {
          'adult': movie.adult,
          'backdrop_path': movie.backdropPath,
          'id': movie.id,
          'original_title': movie.originalTitle,
          'overview': movie.overview,
          'poster_path': movie.posterPath,
          'title' : movie.title

        }
    );
  }

}