import 'package:exercise_2/image_carousel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

const images = ["image_1.avif", "image_2.avif", "image_3.avif"];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text(
            'Image Carousel',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.black12,
        body: Center(child: ImageCarousel(images)),
      ),
    );
  }
}
