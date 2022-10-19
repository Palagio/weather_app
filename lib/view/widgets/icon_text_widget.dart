import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const IconTextWidget({super.key, this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
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
    );
  }
}
