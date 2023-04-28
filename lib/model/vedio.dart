import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Vedio{

  String username;
  String uid;
  String id;
  List likes;
  int commentsCount;
  int shareCount;
  String songName;
  String caption;
  String videoUrl;
  String thumbnail;
  String profilePic;

 Vedio({
  required this.username,
  required this.uid,
  required this.id,
  required this.caption,
  required this.commentsCount,
  required this.likes,
  required this.profilePic,
  required this.shareCount,
  required this.songName,
  required this.thumbnail,
  required this.videoUrl,
 }){
  
 }

 Map<String, dynamic> toJson()=>{
  "username": username,
  "uid": uid,
  "profilePic": profilePic,
  "id": id,
  "likes": likes,
  "commentsCount": commentsCount,
  "shareCount": CupertinoIcons.share_solid,
  "songName": songName,
  "caption": caption,
  "videoUrl": videoUrl,
  "thumbnail": thumbnail,
 };

 static Vedio fromSnap(DocumentSnapshot snap){
  var sst= snap.data() as Map<String, dynamic>;
  return Vedio(
    username: sst['username'],
     uid: sst['uid'], 
     id: sst['id'], 
     caption: sst['caption'], 
     commentsCount: sst['commentsCount'], 
     likes: sst['likes'], 
     profilePic: sst['profilePic'], 
     shareCount: sst['shareCount'], 
     songName: sst['songName'], 
     thumbnail: sst['thumbnail'], 
     videoUrl: sst['videoUrl']
     );

 }

}