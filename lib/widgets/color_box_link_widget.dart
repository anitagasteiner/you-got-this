import 'package:flutter/material.dart';

class ColorBoxLink extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const ColorBoxLink({
    super.key,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 50,
          height: 35,
        ),
      ),
    );
  }

}