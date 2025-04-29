import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_five/app/modules/home/components/movie_section_widget.dart';
import 'package:group_five/app/modules/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Jumbotron
              Obx(() {
                if (controller.trendingMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original${controller.trendingMovies.toList()[controller.randomNumber.value].backdropPath}"),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 36.0, vertical: 8.0),
                            child: Text(
                              "${controller.trendingMovies[controller.randomNumber.value].title}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 36.0, vertical: 8.0),
                            child: Text(
                              "${controller.trendingMovies[controller.randomNumber.value].overview}",
                              maxLines: 3,
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),

              /// Trending Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Trending Movies",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
              Obx(() {
                if (controller.trendingMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.trendingMovies.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                  image:
                                      "https://image.tmdb.org/t/p/original${controller.trendingMovies.toList()[index].backdropPath}",
                                  bgColor: const Color(0xFFFEFBF9),
                                  press: () => Get.toNamed('/detail',
                                          arguments: {
                                            'id': controller.actionMovies
                                                .toList()[index]
                                                .id
                                          })),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),

              /// Action Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Action Movies",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
              Obx(() {
                if (controller.actionMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.actionMovies.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                image:
                                    "https://image.tmdb.org/t/p/original${controller.actionMovies.toList()[index].backdropPath}",
                                bgColor: const Color(0xFFFEFBF9),
                                press: () => Get.toNamed('/detail', arguments: {
                                  'id':
                                      controller.actionMovies.toList()[index].id
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),

              /// Adventure Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Adventure Movies",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
              Obx(() {
                if (controller.adventureMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.adventureMovies.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                  image:
                                      "https://image.tmdb.org/t/p/original${controller.adventureMovies.toList()[index].backdropPath}",
                                  bgColor: const Color(0xFFFEFBF9),
                                  press: () => Get.toNamed('/detail',
                                          arguments: {
                                            'id': controller.actionMovies
                                                .toList()[index]
                                                .id
                                          })),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),

              /// Animation Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Animation Movies",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
              Obx(() {
                if (controller.animationMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.animationMovies.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                  image:
                                      "https://image.tmdb.org/t/p/original${controller.animationMovies.toList()[index].backdropPath}",
                                  bgColor: const Color(0xFFFEFBF9),
                                  press: () => Get.toNamed('/detail',
                                          arguments: {
                                            'search_id': controller.actionMovies
                                                .toList()[index]
                                                .id
                                          })),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),

              /// Comedy Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Comedy Movies",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
              Obx(() {
                if (controller.comedyMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.comedyMovies.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                  image:
                                      "https://image.tmdb.org/t/p/original${controller.comedyMovies.toList()[index].backdropPath}",
                                  bgColor: const Color(0xFFFEFBF9),
                                  press: () => Get.toNamed('/detail',
                                          arguments: {
                                            'id': controller.actionMovies
                                                .toList()[index]
                                                .id
                                          })),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),

              /// Documentary Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Documentary Movies",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
              Obx(() {
                if (controller.documentaryMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.documentaryMovies.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                  image:
                                      "https://image.tmdb.org/t/p/original${controller.documentaryMovies.toList()[index].backdropPath}",
                                  bgColor: const Color(0xFFFEFBF9),
                                  press: () => Get.toNamed('/detail',
                                          arguments: {
                                            'id': controller.actionMovies
                                                .toList()[index]
                                                .id
                                          })),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),

              /// Science-Fiction Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Science-Fiction Movies",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
              Obx(() {
                if (controller.scienceFictionMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.scienceFictionMovies.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                  image:
                                      "https://image.tmdb.org/t/p/original${controller.scienceFictionMovies.toList()[index].backdropPath}",
                                  bgColor: const Color(0xFFFEFBF9),
                                  press: () => Get.toNamed('/detail',
                                          arguments: {
                                            'id': controller.actionMovies
                                                .toList()[index]
                                                .id
                                          })),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),

              /// Thriller Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  "Thriller Movies",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
              Obx(() {
                if (controller.thrillerMovies.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.thrillerMovies.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                  image:
                                      "https://image.tmdb.org/t/p/original${controller.thrillerMovies.toList()[index].backdropPath}",
                                  bgColor: const Color(0xFFFEFBF9),
                                  press: () => Get.toNamed('/detail',
                                          arguments: {
                                            'id': controller.actionMovies
                                                .toList()[index]
                                                .id
                                          })),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
