
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibely/model/user.dart';

class AuthController extends GetxController{
  static AuthController instance =Get.find();
  File? proimg;
  pickImage()async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null)return;
    final img= File(image.path);
    this.proimg=img;
  }

  //User Register
  void SignUp (String username,String email,String password, File? image)async{

      try{
        if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty&& image!=null){
          UserCredential cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password);
           String downloadURL =await _uploadProPic(image);

            myUser user=myUser(email: email, profilePhoto: downloadURL, uid: cred.user!.uid, name: username);
           await FirebaseFirestore.instance.collection('users').doc(cred.user!.uid).set(user.toJson());
             Get.snackbar("Account Created", "Your account has been created successfully");

        }else{
         
          Get.snackbar("Error Creating Account", "Please enter all the required field", colorText: Colors.white);
        }
      }catch(e){
        print(e);
        Get.snackbar("Error Occured", e.toString(), colorText: Colors.white);
      }
  }

  Future<String>_uploadProPic(File image)async{
    Reference ref = FirebaseStorage.instance.ref().child('profilePics').
    child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask=ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDwnUrl=await snapshot.ref.getDownloadURL();
    return imageDwnUrl;
  }
}