import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibely/view/screens/addcaption_screen.dart';
import 'package:vibely/view/widgets/button.dart';

class AddVedioScreen extends StatelessWidget {
 const AddVedioScreen({super.key});

vedioPick(ImageSource src, BuildContext context)async {
  final vedio=await ImagePicker().pickVideo(source: src);
  if(vedio!=null){
    Get.snackbar("Vedio Selected", vedio.path);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCaptionScreen(
      vedioFile: File(vedio.path), vedioPath: vedio.path)));
  }else{
    Get.snackbar("Error In Selecting Vedio", 'Please Choose A Different Vedio File');
  }
}

showDialogOpt(BuildContext context){
  return showDialog(context: context, builder: (context)=> SimpleDialog(
    children: [
      SimpleDialogOption(
        onPressed: ()=> vedioPick(ImageSource.gallery, context),
        child: Row(children: [
          Icon(Icons.folder),
          SizedBox(width: 11,),
          Text('Gallery', style: TextStyle(fontSize: 20),),
        ]),
      ),
       SimpleDialogOption(
        onPressed: ()=>vedioPick(ImageSource.camera, context),
        child: Row(
          children: [
            Icon(Icons.photo),
             SizedBox(width: 11,),
            Text('Camera',style: TextStyle(fontSize: 20),),

          ],
        ),
      ),
       SimpleDialogOption(
        onPressed: (){
           Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(Icons.close),
              SizedBox(width: 11,),
            Text('close',style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    ],
  ), 
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: InkWell(
          onTap: (){},
          child: Button(
            text: 'Add Vedio',
            onTap: () => showDialogOpt(context),
            height: 50,
            width: 200,
          ),
          ),
        ),
    );
  }
}