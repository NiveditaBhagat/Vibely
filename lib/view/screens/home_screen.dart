import 'package:flutter/material.dart';
import 'package:vibely/constants.dart';
import 'package:vibely/view/widgets/custom_add_icon.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 int pageIdx=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
     type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[900],
         unselectedItemColor: Colors.white,
            
            selectedItemColor: Color(0xFFE07699),
        onTap: (value) {
          setState(() {
            pageIdx=value;
          });
        },
        currentIndex: pageIdx,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home, size: 25,color: Colors.white,),
            label: 'Home', 
            ),
           
            BottomNavigationBarItem(
            icon:Icon(Icons.search, size: 25,color: Colors.white,),
            label: 'Search', 
            ),
             BottomNavigationBarItem(
            icon:CustomAddIcon(),
            label: '', 
            ),
             BottomNavigationBarItem(
            icon:Icon(Icons.message, size: 25,color: Colors.white,),
            label: 'Message', 
            ),
             BottomNavigationBarItem(
            icon:Icon(Icons.person, size: 25,color: Colors.white,),
            label: 'Profile', 
            ),
            
            


        ],
        ),
        body: Center(
          child: Text(pageindex[pageIdx], style: TextStyle(color: Colors.white),) ,
        ),
    );
  }
}