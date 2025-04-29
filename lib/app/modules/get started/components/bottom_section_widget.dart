import 'package:flutter/material.dart';

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style:const TextStyle(
            letterSpacing: 2,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white70
          ),
        ),
        const SizedBox(height: 20,),
        const Text(
          "              Netflix is a subscription-based\n            streaming service that allows our\n    members to watch TV shows and movies...",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}