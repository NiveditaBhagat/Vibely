import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
   ProfileButton({super.key, required this.profilePhotoUrl});
String profilePhotoUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  //image: NetworkImage(profilePhotoUrl),
                  image: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                  fit: BoxFit.cover,               
                ),
              ),
            ), 
            ),
        ],
      ),
    );
  }
}