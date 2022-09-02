import 'package:flutter/cupertino.dart';

class Menu {
  final String title;
  final IconData icon;
  final Function(BuildContext context) onClick;

  Menu(this.title, this.icon, this.onClick);
}