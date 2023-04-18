import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

class VideoUploadController extends GetxController{
  var uuid = Uuid();

 Future<File> _getThumb(String videoPath)async{
    final thumbnail= await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

 Future<String>_uploadVideoThumbToStoarage(String id, String videoPath)async{
     Reference reference=FirebaseStorage.instance.ref().child('thumbnail').child(id);
    UploadTask uploadTask=reference.putFile(await _getThumb(videoPath));
    TaskSnapshot snapshot=await uploadTask;
    String downloadUrl= await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVideo(String songName, String caption, String vedioPath) async {
     String uid= FirebaseAuth.instance.currentUser!.uid;
     

     DocumentSnapshot userDoc= await FirebaseFirestore.instance.collection("users").doc(uid).get();
      String id=uuid.v1();
     _uploadVideoToStoarage(id, vedioPath);

     String thumbnail=await _uploadVideoThumbToStoarage(id, vedioPath);
  }

  Future<String> _uploadVideoToStoarage (String videoId, String videoPath)async{
    Reference reference=FirebaseStorage.instance.ref().child('videos').child(videoId);
    UploadTask uploadTask=reference.putFile(_compressVideo(videoPath));
    TaskSnapshot snapshot=await uploadTask;
    String downloadUrl= await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

 _compressVideo(String videoPath)async{
    final compressedVideo= 
    await VideoCompress.compressVideo(videoPath, quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }
}