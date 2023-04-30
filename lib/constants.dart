import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vibely/view/screens/add_vedio.dart';
import 'package:vibely/view/screens/display_screen.dart';

// getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];

getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageindex=[
  DisplayVedio_Screen(),

  Text('Search',style: TextStyle(color: Colors.white),),
   AddVedioScreen(),
  Text('Messages',style: TextStyle(color: Colors.white),),
  Text('Profile',style: TextStyle(color: Colors.white),),
];