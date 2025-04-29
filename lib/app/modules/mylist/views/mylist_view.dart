import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:group_five/app/modules/mylist/controller/mylist_controller.dart';


class MylistView extends GetView<MylistController>{
  const MylistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() => SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: controller.mylistMovies.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Slidable(
                          key: const ValueKey(0),
                          endActionPane:  ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                                onPressed: (context) => Get.toNamed('/detail', arguments: {'id': controller.mylistMovies.toList()[index].id}),
                                backgroundColor: const Color(0xFF7BC043),
                                foregroundColor: Colors.white,
                                icon: Icons.tv,
                                label: 'Details',
                              ),
                              SlidableAction(
                                onPressed: (context)async{
                                  controller.deleteMylist(controller.mylistMovies.toList()[index].id!);
                                  final snackBar = SnackBar(
                                    content: Text('${controller.mylistMovies.toList()[index].title!} deleted.'),
                                    backgroundColor: Colors.orange,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage('https://image.tmdb.org/t/p/original${controller.mylistMovies.toList()[index].backdropPath}'),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                            title: Text('${controller.mylistMovies.toList()[index].originalTitle}', style: const TextStyle(color: Colors.white70, fontSize: 18),),
                            subtitle: Text('${controller.mylistMovies.toList()[index].overview}', style: const TextStyle(color: Colors.white38, fontSize: 16), maxLines: 2,),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )),
        ),
      ),
    );
  }

}