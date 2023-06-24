import 'package:flutter/material.dart';

class OnbordingContent extends StatelessWidget {
  const OnbordingContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 5,
        ),
        Image(
          image: AssetImage(image),
          width: 250,
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
