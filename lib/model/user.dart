import 'package:cloud_firestore/cloud_firestore.dart';

class myUser{
  String name;
  String profilePhoto;
  String email;
  String uid;

  myUser({
   required this.email,
   required this.profilePhoto,
   required this.uid,
   required this.name,
  });

  Map<String, dynamic> toJson(){
    return {
      "name": name,
      "profilePhoto": profilePhoto,
      "email": email,
      "uid": uid, 
    };
  }

  static myUser fromSnap(DocumentSnapshot snap){
    var snapshot= snap.data() as Map<String, dynamic>;
    return myUser(
      email: snapshot['email'], 
      profilePhoto: snapshot['profilePhoto'], 
      uid: snapshot['uid'], 
      name: snapshot['name'],
      );
  }

  void saveUserData() async {
    final userRef = FirebaseFirestore.instance.collection('users');
    await userRef.add(toJson());
  }
}