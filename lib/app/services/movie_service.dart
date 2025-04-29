import 'dart:convert';
import 'package:group_five/app/core/api.dart';
import 'package:group_five/app/core/constants.dart';
import 'package:group_five/app/models/casting.dart';
import 'package:group_five/app/models/movie.dart';
import 'package:group_five/app/models/video.dart';

class MovieService {
  static Future<List<Movie>> getMovies(String path) async {
    var response = await Api().dio.get(path);

    var resData = jsonDecode(response.data)["results"] as List<dynamic>;
    return resData.map((res) {
      return Movie(
          adult: res["adult"],
          backdropPath: res["backdrop_path"],
          id: res["id"],
          originalLanguage: res["original_language"],
          originalTitle: res["original_title"],
          overview: res["overview"],
          popularity: res["popularity"],
          posterPath: res["poster_path"],
          releaseDate: res["release_date"],
          title: res["title"],
          video: res["video"],
          voteAverage: res["vote_average"],
          voteCount: res["vote_count"]);
    }).toList();
  }

  static Future<Movie> getDetails(int id) async {
    var response = await Api().dio.get('/movie/$id?api_key=${AppConstants.apikey}&language=${AppConstants.language}');

    var overview = jsonDecode(response.data)["overview"];
    var originalTitle = jsonDecode(response.data)["original_title"];
    var backdropPath = jsonDecode(response.data)["backdrop_path"];

    return Movie(
      overview: overview,
      originalTitle: originalTitle,
      backdropPath: backdropPath
    );
  }

  static Future<List<Casting>> getCasting(int id) async {
    var response = await Api().dio.get(
      '/movie/$id/credits?api_key=${AppConstants.apikey}'
    );

    var resData = jsonDecode(response.data)["cast"] as List<dynamic>;
    return resData.map((res) {
      return Casting(
        originalName: res["original_name"],
        profilePath: res["profile_path"],
        character: res["character"],
      );
    }).toList();
  }

  static Future<List<Video>> getVideo(int id) async {
    var response = await Api().dio.get(
        '/movie/$id/videos?api_key=${AppConstants.apikey}'
    );

    var resData = jsonDecode(response.data)["results"] as List<dynamic>;
    return resData.map((res) {
      return Video(
        iso_639_1: res["original_name"],
        iso_3166_1: res["profile_path"],
        name: res["character"],
        key: res["key"],
        site: res["site"],
        size: res["size"],
        type: res["type"],
        official: res["official"],
        publishedAt: res["published_at"],
        id: res["id"],
      );
    }).toList();
  }


}
