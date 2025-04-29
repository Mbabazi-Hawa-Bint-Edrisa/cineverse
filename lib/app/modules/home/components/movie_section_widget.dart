import 'package:flutter/material.dart';

class MovieSectionWidget extends StatelessWidget {
  const MovieSectionWidget({
    Key? key,
    this.image,
    this.press,
    this.bgColor,
  }) : super(key: key);
  final String? image;
  final VoidCallback? press;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            image: DecorationImage(
              image: NetworkImage("$image"),
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }
}