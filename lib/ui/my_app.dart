import 'package:flutter/material.dart';
import 'package:world_time/ui/screens/choose_location.dart';
import 'package:world_time/ui/screens/home.dart';
import 'package:world_time/ui/screens/loading.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: "/home",
      routes: {
        "/":(context)=>Loading(),
        "/home":(context)=>Home(),
        "/choose_location":(context)=>ChooseLocation(),
      },
    );
  }

}