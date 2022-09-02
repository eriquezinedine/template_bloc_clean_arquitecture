
import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    Key? key,
    required this.title,
    required this.onClick,
    required this.icon
  }) : super(key: key);
  final String title;
  final VoidCallback onClick;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
       width: 100,
       height: 100,
       decoration: const BoxDecoration(
         color: Colors.teal,
         borderRadius: BorderRadius.all(Radius.circular(20))
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
            Icon(icon, size: 35, color: Colors.white,),
           Text(title, style: const TextStyle(
             color: Colors.white,
             fontSize: 18,
             fontWeight: FontWeight.bold
           ),),
         ],
       ),
      ),
    );
  }
}
