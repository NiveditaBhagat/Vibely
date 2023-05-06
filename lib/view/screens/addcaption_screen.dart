import 'dart:io';
import 'package:vibely/controller/upload_video_controller.dart';
import 'package:vibely/view/widgets/button.dart';
import 'package:vibely/view/widgets/text_input.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCaptionScreen extends StatefulWidget {
  File vedioFile;
  String? vedioPath;
  
 AddCaptionScreen({super.key,
  required this.vedioFile,
  required this.vedioPath
  });

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends State<AddCaptionScreen> {

  late VideoPlayerController vedioPlayerController;
  VideoUploadController videoUploadController= Get.put(VideoUploadController());
  TextEditingController songNameController= TextEditingController();
  TextEditingController captionController= TextEditingController();

  Widget UploadContent = Text("Upload");

  uploadVid(){
  UploadContent = Text("Please Wait..");
   setState(() {

   });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      vedioPlayerController= VideoPlayerController.file(widget.vedioFile);
    });
    vedioPlayerController.initialize();
    vedioPlayerController.play();
    vedioPlayerController.setLooping(true);
    vedioPlayerController.setVolume(0.7);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.4,
              child:VideoPlayer(vedioPlayerController),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextInputField(
                      controller: songNameController, 
                      myLabelText: 'Song', 
                      myIcon: Icons.music_note),
                      SizedBox(
                        height: 15,
                      ),
                      TextInputField(
                        controller: captionController, 
                        myLabelText: 'Caption', 
                        myIcon: Icons.closed_caption,
                        ),
                        SizedBox(height: 17,),
                        Button(
                          text: 'Upload', onTap: (){
                             uploadVid();
                          videoUploadController.uploadVideo(songNameController.text, 
                          captionController.text, widget.vedioPath!);
                        }, height: 42, width: 200),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}