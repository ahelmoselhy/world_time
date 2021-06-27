import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

import 'package:world_time/data/services/world_time.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  WorldTime worldTime = WorldTime();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    worldTime.getDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Loading"),
    )));
  }
}
