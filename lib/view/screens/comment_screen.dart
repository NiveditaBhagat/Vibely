import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index){
                 return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                  
                  ),
                  title: Row(
                    children: [
                      Text('Username'),
                      Text("Comment"),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text("DateTime"),
                      Text('10 likes'),
                    ]
                    ),
                    trailing: Icon(Icons.favorite),
                 );
        
                },
              )
          ]
          ),
        ),
      ),
    );
  }
}