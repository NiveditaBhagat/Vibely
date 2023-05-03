import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vibely/model/vedio.dart';
class VideoController extends GetxController{
  final Rx<List<Vedio>> _videoList= Rx<List<Vedio>>([]);
  List<Vedio> get videoList=> _videoList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _videoList.bindStream(FirebaseFirestore.instance.collection("videos").snapshots().map((QuerySnapshot query){
      List<Vedio> retVal=[];
      for(var  element in query.docs){
        retVal.add(Vedio.fromSnap(element));
      }
      return retVal;
    }));
  }
}