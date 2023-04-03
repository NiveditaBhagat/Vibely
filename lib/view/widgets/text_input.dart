import 'package:flutter/material.dart';
import 'package:vibely/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData myIcon;
  final String myLabelText;
  final bool toHide;
  TextInputField({
    super.key,
    required this.controller,
    required this.myLabelText,
    required this.myIcon,
    this.toHide = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.grey, fontSize: 18), 
      cursorColor: Colors.white,
      obscureText: toHide,
      controller: controller,
      decoration: InputDecoration(
    
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.2),
        border: InputBorder.none,
         prefixIcon: Icon(myIcon, color: Colors.grey,),
         hintText: myLabelText,
        hintStyle: TextStyle(color: Colors.grey)
      ),
    );
  }
}
