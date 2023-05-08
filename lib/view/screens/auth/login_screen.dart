import 'package:flutter/material.dart';
import 'package:vibely/constants.dart';
import 'package:vibely/controller/auth_controller.dart';
import 'package:vibely/view/screens/auth/signup_screen.dart';
import 'package:vibely/view/widgets/button.dart';
import 'package:vibely/view/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          color: backgroundColor,
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
                  controller: _passwordController,
                  myLabelText: "Password",
                  myIcon: Icons.lock,
                  toHide: true,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Container(
                child: Button(
                  text: 'LOGIN',
                  onTap: () {
                    AuthController.instance.login(
                        _emailController.text, _passwordController.text);
                  },
                  height: screenHeight * 0.08,
                  width: screenHeight * 0.5,
                ),
                height: 50,
              ),
               SizedBox(height: 20),
                        Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
