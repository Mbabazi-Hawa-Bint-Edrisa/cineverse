import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:group_five/app/modules/detail/controller/detail_controller.dart';
import 'package:group_five/app/modules/home/components/movie_section_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailView extends GetView<DetailController>{
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Jumbotron && Appbar && VideoPlayer
                Stack(
                  children: [
                    controller.isPlayerReady.value
                        ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: YoutubePlayer(
                        controller: controller.videocontroller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                        topActions: <Widget>[
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              controller.videocontroller.metadata.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 25.0,
                            ),
                            onPressed: () {
                              log('Settings Tapped!');
                            },
                          ),
                        ],
                        onReady: () {
                          controller.isPlayerReady.value = true;
                        },
                        onEnded: (data) {},
                      )
                    )
                        : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("https://image.tmdb.org/t/p/original${controller.detailMovie.value.backdropPath}"),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                    Positioned(
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.arrow_back, color: Colors.white70, size: 24,),
                        )
                    ),
                    Positioned(
                        right: 8,
                        child: IconButton(
                          onPressed: () {
                            controller.postMylist();
                            final snackBar = SnackBar(
                              content: Text('${controller.detailMovie.value.originalTitle} added My List.'),
                              backgroundColor: Colors.orange,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          icon: const Icon(Icons.favorite, color: Colors.white70, size: 24,),
                        )
                    )
                  ],
                ),
                /// Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${controller.detailMovie.value.originalTitle}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                      controller.isPlayerReady.value
                          ? ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(Colors.red[600]),
                          elevation: WidgetStateProperty.all(3),
                        ),
                        onPressed: (){
                          controller.isPlayerReady.value = false;
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.cancel_outlined, color: Colors.white,),
                            SizedBox(width: 5,),
                            Text("Cancel", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )
                          : ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(Colors.red[600]),
                          elevation: WidgetStateProperty.all(3),
                        ),
                        onPressed: (){
                          controller.isPlayerReady.value = true;
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.play_arrow, color: Colors.white,),
                            SizedBox(width: 5,),
                            Text("Play", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                /// Overview
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("${controller.detailMovie.value.overview}", style: const TextStyle(color: Colors.white60, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
                /// Casting
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: Text("Casting", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
                ),
                controller.castingList.isEmpty
                    ? Container()
                    : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage("https://image.tmdb.org/t/p/original${controller.castingList[index].profilePath}"),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                          title: Text('${controller.castingList[index].character}', style: const TextStyle(color: Colors.white70, fontSize: 18),),
                          subtitle: Text('${controller.castingList[index].originalName}', style: const TextStyle(color: Colors.white38, fontSize: 16),),
                        );
                      },
                    )
                ),
                /// Similar Movies
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Text("Similar Movies", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.similarMovies.length,
                            (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: MovieSectionWidget(
                                image: "https://image.tmdb.org/t/p/original${controller.similarMovies.toList()[index].backdropPath}",
                                bgColor: const Color(0xFFFEFBF9),
                                press: () => Get.toNamed('/detail', arguments: {'id': controller.similarMovies.toList()[index].id}, preventDuplicates: false)
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

}