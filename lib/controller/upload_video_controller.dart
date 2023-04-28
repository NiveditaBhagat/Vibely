import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

import '../model/vedio.dart';

class VideoUploadController extends GetxController {
    static VideoUploadController instance = Get.find();
  var uuid = Uuid();

  Future<File> _getThumb(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadVideoThumbToStoarage(
      String id, String videoPath) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('thumbnail').child(id);
    UploadTask uploadTask = reference.putFile(await _getThumb(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVideo(String songName, String caption, String vedioPath) async {

    try{
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    String id = uuid.v1();
    String vedioUrl=await _uploadVideoToStoarage(id, vedioPath);

    String thumbnail = await _uploadVideoThumbToStoarage(id, vedioPath);
    Vedio video = Vedio(
      uid: uid,
      username: (userDoc.data! as Map<String, dynamic>)['name'],
      videoUrl: vedioUrl,
      thumbnail: thumbnail,
      songName: songName,
      shareCount: 0,
      commentsCount: 0,
      likes: [],
      profilePic: (userDoc.data! as Map<String, dynamic>)['profilePic'],
      caption: caption,
      id: id
    );

    await FirebaseFirestore.instance.collection("videos").doc(id).set(video.toJson());
    Get.snackbar('Vedio uploaded Successfully', " ");
    Get.back(); 
    }catch(e){
      Get.snackbar("Error uploading vedio", e.toString());
    }
  }

  Future<String> _uploadVideoToStoarage(
      String videoId, String videoPath) async {
    Reference reference =
        FirebaseStorage.instance.ref().child('videos').child(videoId);
    UploadTask uploadTask = reference.putFile(_compressVideo(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }
}
