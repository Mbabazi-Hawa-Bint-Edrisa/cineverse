import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_five/app/modules/search/controller/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController> {
  const SearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Search Page View')),
    );
  }
}