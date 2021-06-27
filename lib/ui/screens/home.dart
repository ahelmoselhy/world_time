import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context,"/choose_location");
            },
            icon: Icon(Icons.add_location,color: Colors.grey[600]),
            label: Text("Home", style: TextStyle(color: Colors.grey[600])),
          ),
        ),
      ),
    );
  }
}
