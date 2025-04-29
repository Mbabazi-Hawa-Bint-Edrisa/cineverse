import 'package:flutter/material.dart';


import 'appbar_section_widget.dart';
import 'bottom_section_widget.dart';


class SecondScreenWidget extends StatelessWidget {
  const SecondScreenWidget({
    Key? key,
    required this.imageAssets,
    required this.title,
  }) : super(key: key);

  final String imageAssets;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AppBarSectionWidget(),
          const SizedBox(
            height: 20,
          ),
          Image.asset(imageAssets),
          BottomSectionWidget(title: title)
        ],
      ),
    );
  }
}
