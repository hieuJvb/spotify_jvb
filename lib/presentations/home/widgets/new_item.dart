import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String artist;

  const NewsItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: media.height * 0.18,
          width: media.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),

      ],
    );
  }
}
