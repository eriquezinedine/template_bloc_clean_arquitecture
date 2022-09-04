import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
   
  const PageWidget({Key? key, required this.appbar, required this.body}) : super(key: key);
  final AppBar appbar;
  final Widget body;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: appbar,
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
            top: 8
          ),
          // height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20
          ),
          decoration: const BoxDecoration(
            color: Color(0xffF5F6F8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50)
            )
          ),
          child: body,
      )
  );
  }
}