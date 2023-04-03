import 'package:flutter/material.dart';
import 'package:vibely/constants.dart';
import 'package:vibely/view/widgets/button.dart';
import 'package:vibely/view/widgets/text_input.dart';
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
TextEditingController _emailController = new TextEditingController();
TextEditingController _setpasswordController = new TextEditingController();
TextEditingController _confirmpasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: backgroundColor,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
            Text('Vibely', 
            style: TextStyle(
              fontFamily: 'Billabong', 
              fontSize: 65,
            color: Colors.white),),
            Stack(
              children: [
                CircleAvatar(
                 backgroundImage: AssetImage('assets/default.jpg'),
                  radius: 65,
                ),
                Positioned(bottom: 0,right: 0, child: Icon(Icons.photo_camera, color: Colors.white,size: 30,))
              ],
             ),
            SizedBox(height: 39,),
              
               
              Container(
                margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  myLabelText: "Email",
                  myIcon: Icons.email,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _setpasswordController,
                  myLabelText: "Set Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
                
              ),
              SizedBox(height: 20,),
                 Container(
                margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _confirmpasswordController,
                  myLabelText: "Confirm Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
                
              ),
                SizedBox(height: 20,),
                Container(
                margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  myLabelText: "Username",
                  myIcon: Icons.person,
                ),
              ),
               SizedBox(height: 40,),
              Button(
                text: 'SIGN UP',
                onTap: (){},
              )
            ],
          ),
        ),
      ),
    );
  }
}