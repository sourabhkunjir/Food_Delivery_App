import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  final image;
  final String title;
  final String subTitle;
  final Color color;

  const IntroPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text(title),
              SizedBox(
                height: 20,
              ),
              Text(subTitle),
            ],
          ),
        ),
      ),
    );
  }
}
