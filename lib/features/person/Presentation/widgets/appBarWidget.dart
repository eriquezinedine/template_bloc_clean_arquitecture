import 'package:flutter/material.dart';

AppBar appBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: ()=>Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.black,)
      ),
    );
  }