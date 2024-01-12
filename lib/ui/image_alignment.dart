import 'package:flutter/material.dart';

// https://stackoverflow.com/questions/77792548/how-to-move-image-in-flutter-card-by-small-amount/77793310#77793310
class ImageAlignment extends StatelessWidget {
  const ImageAlignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Card(
            margin: const EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/sail.jpg',
                fit: BoxFit.cover,
                // customize the alignment of the image
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
