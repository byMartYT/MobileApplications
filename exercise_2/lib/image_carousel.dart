import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  ImageCarousel(this.images, {super.key})
    : assert(
        images.isNotEmpty,
        'The images list must contain at least one image.',
      );

  final List<String> images;

  @override
  State<StatefulWidget> createState() => _ImageCarousel();
}

class _ImageCarousel extends State<ImageCarousel> {
  int currentImage = 0;

  void changeImage(int value) {
    assert(value == -1 || value == 1);
    setState(() {
      currentImage = (currentImage + value) % widget.images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        spacing: 20,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/${widget.images[currentImage]}',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton.icon(
                onPressed: () => changeImage(-1),
                label: const Text(
                  'Back',
                  style: TextStyle(color: Colors.deepOrange),
                ),
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.deepOrange,
                ),
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color.fromARGB(255, 18, 18, 18),
                  ),
                ),
              ),
              Text(
                '${currentImage + 1}/${widget.images.length}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              FilledButton.icon(
                onPressed: () => changeImage(1),
                label: const Text('Next'),
                icon: const Icon(Icons.arrow_forward, size: 30),
                iconAlignment: IconAlignment.end,
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.deepOrange),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
