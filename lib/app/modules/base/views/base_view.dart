import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_five/app/modules/base/controller/base_controller.dart';
import 'package:group_five/app/modules/home/views/home_view.dart';
import 'package:group_five/app/modules/mylist/controller/mylist_controller.dart';
import 'package:group_five/app/modules/mylist/views/mylist_view.dart';
// import 'package:group_five/app/modules/search/controller/search_page_controller.dart';
import 'package:group_five/app/modules/search/views/search_page_view.dart';

// ignore: must_be_immutable
class BaseView extends GetView<BaseController>{
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    SearchPageView(),
    const MylistView(),
  ];

  List<String> appbarTitleList = [
    "Home","Search","My List"
  ];

  BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      Get.put(MylistController());
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: _buildAppBar(controller.selectedIndex.value),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite,),
              label: "My List",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.white60,
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.white,
          onTap: controller.onItemTapped,
        ),
        body: _widgetOptions.elementAt(controller.selectedIndex.value),
      );
    });
  }

  PreferredSizeWidget _buildAppBar(int index) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      leading: Image.asset(
        'assets/images/netflix_logo.png',
        height: 70,
      ),
      title: Text(
        appbarTitleList[index],
        style: const TextStyle(
          color: Colors.white70,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () => Get.offAllNamed('/get-started'),
            icon: const Icon(Icons.logout, color: Colors.white60,)
        ),
      ],
    );
  }
}
