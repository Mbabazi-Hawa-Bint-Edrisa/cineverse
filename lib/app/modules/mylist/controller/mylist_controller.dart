import 'package:get/get.dart';
import 'package:group_five/app/core/constants.dart';
import 'package:group_five/app/models/movie.dart';
import 'package:group_five/app/services/mylist_service.dart';

class MylistController extends GetxController{
  var mylistMovies = List<Movie>.empty().obs;
  var isDeleted = false.obs;
  @override
  void onInit() {
    super.onInit();
    getMylistMovies();
  }

  void getMylistMovies() async{
      var result = await MylistService.getMylist(
          '${AppConstants.userId}'
      );
      mylistMovies.value = result;
  }

  void deleteMylist(int id) async{
    try {
      // var result = await MylistService.deleteMylist(id).then((value) => getMylistMovies());
    } catch (e) {
      throw Exception(e);
    }
  }
}