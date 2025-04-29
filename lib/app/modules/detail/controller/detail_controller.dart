import 'package:get/get.dart';
import 'package:group_five/app/core/constants.dart';
import 'package:group_five/app/models/casting.dart';
import 'package:group_five/app/models/movie.dart';
import 'package:group_five/app/models/video.dart';
import 'package:group_five/app/services/movie_service.dart';
import 'package:group_five/app/services/mylist_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailController extends GetxController{
  var detailMovie = Movie().obs;
  int getID = Get.arguments['id'] ?? 0;
  var castingList = List<Casting>.empty().obs;
  var similarMovies = List<Movie>.empty().obs;
  var videoKeyList = List<Video>.empty().obs;
  var videoKey = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getDetailMovie();
    getCasting();
    getSimilarMovies();
    getVideoKey();
  }

  void getDetailMovie() async{
    try {
      var result = await MovieService.getDetails(getID);
      detailMovie.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getCasting() async{
    try {
      var result = await MovieService.getCasting(getID);
      castingList.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getSimilarMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/movie/$getID/similar?api_key=${AppConstants.apikey}&language=${AppConstants.language}&&sort_by=popularity.desc'
      );
      similarMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getVideoKey() async{
    try {
      var result = await MovieService.getVideo(getID);
      videoKeyList.value = result;
      for(var item in videoKeyList){
        if(item.type == "Trailer"){
          videoKey.value = item.key!;
          videocontroller = YoutubePlayerController(
            initialVideoId: videoKey.value,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: true,
            ),
          );
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  ///video
  late YoutubePlayerController videocontroller;
  // ignore: unused_field
  late PlayerState _playerState;
  // ignore: unused_field
  late YoutubeMetaData _videoMetaData;
  var isPlayerReady = false.obs;

  void listener() {
    if (isPlayerReady.value  && !videocontroller.value.isFullScreen) {
      _playerState = videocontroller.value.playerState;
      _videoMetaData = videocontroller.metadata;
    }
  }

  void postMylist() async{
    try {
      // ignore: unused_local_variable
      var result = await MylistService.postMylist(detailMovie.value);
    } catch (e) {
      throw Exception(e);
    }
  }


}


