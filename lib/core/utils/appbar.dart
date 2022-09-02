import 'package:flutter/material.dart';

AppBar appbar({required title }) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title:  Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold
      ),
    ),
  );
}