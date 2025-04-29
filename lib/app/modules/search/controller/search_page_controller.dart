import 'package:get/get.dart';
import 'package:group_five/app/core/constants.dart';
import 'package:group_five/app/models/movie.dart';
import 'package:group_five/app/services/movie_service.dart';

class SearchPageController extends GetxController{
  var searchWord = "".obs;
  var searchMovies = List<Movie>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    getSearchMovies();
  }

  void getSearchMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/search/movie?api_key=${AppConstants.apikey}&query=${searchWord.value}'
      );
      searchMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

}