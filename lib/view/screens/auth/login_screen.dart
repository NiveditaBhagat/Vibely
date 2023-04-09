import 'package:flutter/material.dart';
import 'package:vibely/constants.dart';
import 'package:vibely/controller/auth_controller.dart';
import 'package:vibely/view/widgets/button.dart';
import 'package:vibely/view/widgets/text_input.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
TextEditingController _emailController = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: backgroundColor,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Vibely', 
          style: TextStyle(
            fontFamily: 'Billabong', 
            fontSize: 70,
          color: Colors.white),),
          SizedBox(height: 10,),
      
            SizedBox(height: 29,),
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
                controller: _passwordController,
                myLabelText: "Password",
                myIcon: Icons.lock,
                toHide: true,
              ),
              
            ),
            SizedBox(height: 40,),
            Button(
              text: 'LOGIN',
              onTap: (){
                AuthController.instance.login(_emailController.text, _passwordController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}