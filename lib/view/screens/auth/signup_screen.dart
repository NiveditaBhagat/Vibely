import 'package:flutter/material.dart';
import 'package:vibely/constants.dart';
import 'package:vibely/controller/auth_controller.dart';
import 'package:vibely/view/widgets/button.dart';
import 'package:vibely/view/widgets/text_input.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _setpasswordController = new TextEditingController();
  TextEditingController _confirmpasswordController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: backgroundColor,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Vibely',
                style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: screenHeight * 0.1,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              InkWell(
                onTap: () {
                  AuthController.instance.pickImage();
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/default.jpg'),
                      radius: screenHeight * 0.12,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.photo_camera,
                        color: Colors.white,
                        size: screenHeight * 0.03,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.039),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.03),
                child: TextInputField(
                  controller: _emailController,
                  myLabelText: "Email",
                  myIcon: Icons.email,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.03),
                child: TextInputField(
                  controller: _setpasswordController,
                  myLabelText: "Set Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.03),
                child: TextInputField(
                  controller: _confirmpasswordController,
                  myLabelText: "Confirm Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.03),
                child: TextInputField(
                  controller: _usernameController,
                  myLabelText: "Username",
                  myIcon: Icons.person,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Button(
                text: 'SIGN UP',
                onTap: () {
                  AuthController.instance.SignUp(_usernameController.text,
                      _emailController.text, _setpasswordController.text, AuthController.instance.proimg);
                },
                height: screenHeight * 0.08,
                width: screenHeight * 0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
