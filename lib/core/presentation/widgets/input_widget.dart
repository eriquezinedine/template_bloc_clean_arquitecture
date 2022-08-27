import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({super.key, required this.label, required this.placeholder, required this.icon, required this.controller});
  final String label;
  final String placeholder;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:   [
           Text( label, style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
          const SizedBox(height: 10,),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border:  const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              hintText: placeholder,
              prefixIcon: Icon(icon)
            ),
          )
        ],
      ),
    );
  }
}