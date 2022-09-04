import 'package:flutter/material.dart';

class ButtonOption extends StatelessWidget {
  const ButtonOption({
    Key? key, required this.title, required this.onPressed, required this.icon, required this.color, required this.hero,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  final int hero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          heroTag: hero,
          onPressed: onPressed,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white,),
        ),
        const SizedBox(height: 5,),
        Text(title),
        const SizedBox(height: 15,),
      ],
    );
  }
}