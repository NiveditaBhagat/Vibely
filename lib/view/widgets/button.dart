import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
final void Function() onTap;
final double height;
final double width;
  const Button({Key? key, required this.text, required this.onTap, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text, 
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
              ),
          ),
        ),
         decoration: BoxDecoration(
          gradient: LinearGradient(colors:[
            Color(0xFFE07699),
           
            Color(0xFFD485BF),
            Color(0xFFC994DC),
           
            // Color(0xFF9A84E6),
            Color(0xFFB68CE4),
           
          ] ),
    
         borderRadius: BorderRadius.circular(30),
        
         ),
         height: height,
         width: width,
      ),
    );
  }
}