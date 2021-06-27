import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  bool isSplash = false;
  bool isVerify = false;
  bool isFirebaseToken = false;

  void getData() async {
    Future.delayed(Duration(seconds: 3), () {


      isSplash = true;
    });

    isFirebaseToken = await Future.delayed(Duration(seconds: 3), () {
      return true;
    });

    isVerify = await Future.delayed(Duration(seconds: 2), () {
      return true;
    });

    if (isSplash && isVerify && isVerify) {
      print("true");
    } else
      print("false");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
        centerTitle: true,
      ),
    );
  }
}
