import 'package:flutter/material.dart';

class InfoTitle extends StatelessWidget {
  const InfoTitle({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          subTitle,
          style: const TextStyle(color: Colors.white70),
        )
      ],
    );
  }
}
