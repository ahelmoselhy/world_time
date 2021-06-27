import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class WorldTime {

   var date;


   void getDate() async{
     Response response =  await get(Uri.parse("http://worldtimeapi.org/api/timezone/Africa/Cairo"));
     Map data = jsonDecode(response.body);
     print(data);
     date = data['dateTime'];
     print(date);
   }

}
