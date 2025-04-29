import 'package:flutter/material.dart';

class AppBarSectionWidget extends StatelessWidget {
  const AppBarSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/images/logo.png',
            height: 70,
          ),
        ),
      ),
    );
  }
}