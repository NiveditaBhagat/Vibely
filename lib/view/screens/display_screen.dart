import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibely/controller/vedio_controller.dart';

import 'package:vibely/view/screens/comment_screen.dart';
import 'package:vibely/view/widgets/album_rotator.dart';
import 'package:vibely/view/widgets/profile_button.dart';

import '../widgets/tiktok_vedio_player.dart';

class DisplayVedio_Screen extends StatefulWidget {
  DisplayVedio_Screen({Key? key}) : super(key: key);

  @override
  State<DisplayVedio_Screen> createState() => _DisplayVedio_ScreenState();
}

class _DisplayVedio_ScreenState extends State<DisplayVedio_Screen> {
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    print('Building DisplayVideoScreen...');

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        itemCount: videoController.videoList.length,
        itemBuilder: (context, index) {
          final data = videoController.videoList[index];

          return Stack(
            children: [
              TikTokVideoPlayer(videoUrl: data.videoUrl),
              Container(
                margin: EdgeInsets.only(bottom: 10, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(data.username, style: TextStyle(color: Colors.white)),
                    Text(data.caption, style: TextStyle(color: Colors.white)),
                    Text(data.songName, style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height - 500,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileButton(profilePhotoUrl: data.profilePic),
                      InkWell(
                        onTap: () {
                          videoController.likedVedio(data.id);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 35,
                              color: Colors.pinkAccent,
                            ),
                            Text(data.likes.length.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(height: 7),
                      Column(
                        children: [
                          Icon(Icons.reply, size: 35, color: Colors.white),
                          Text('Share',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                        ],
                      ),
                      SizedBox(height: 7),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentScreen(),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Icon(Icons.comment, size: 35, color: Colors.white),
                            Text(
                              data.commentsCount.toString(),
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            AlbumRotator(profilePicUrl: data.profilePic),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
