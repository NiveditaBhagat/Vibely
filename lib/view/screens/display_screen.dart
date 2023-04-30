import 'package:flutter/material.dart';
import 'package:vibely/view/widgets/profile_button.dart';
import 'package:vibely/view/widgets/tiktok_vedio_player.dart';

class DisplayVedio_Screen extends StatelessWidget {
  const DisplayVedio_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        itemCount: 10,
        itemBuilder: (context, index){
          return Stack(
            children: [
              TikTokVideoPlayer(videoUrl: 'aaa',),
              Container(
                margin: EdgeInsets.only(bottom: 10, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('@Username', style: TextStyle(color: Colors.white),),
                    Text('  MY CAPTION IS HERE', style: TextStyle(color: Colors.white),),
                    Text('SONG NAME', style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                   height: MediaQuery.of(context).size.height-500,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    
                    children: [
                  
                     ProfileButton(profilePhotoUrl: 'ADD'),
                     Column(
                      children: [
                        Icon(Icons.favorite, size: 35, color: Colors.white,),
                        Text('Like', style: TextStyle(fontSize: 14, color: Colors.white),),
              
                      ],
                     ),
                 SizedBox(height: 7,),
                      Column(
                      children: [
                        Icon(Icons.reply, size: 35, color: Colors.white,),
                        Text('Share', style: TextStyle(fontSize: 14, color: Colors.white),),
              
                      ],
                     ),
                      SizedBox(height: 7,),
                     Column(
                      children: [
                        Icon(Icons.comment, size: 35, color: Colors.white,),
                        Text('Comments', style: TextStyle(fontSize: 14, color: Colors.white),),
              
                      ],
                     ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}