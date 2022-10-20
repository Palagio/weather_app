import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final String image;
  final String? text;
  const IconTextWidget({super.key, required this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
