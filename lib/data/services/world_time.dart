import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart' as intl;

class WorldTime {
  String offset = '';
  bool isDayTime = false;

  String location = '';
  String time = '';
  String flag = '';
  String url = '';


  WorldTime(this.location, this.flag, this.url);

  getDate() async {
    try {
      Response response = await get(
          Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      print(data);
      time = data['datetime'];
      offset = data['utc_offset'];

      DateTime now = DateTime.parse(time);
      now.add(Duration(hours: int.parse(offset.substring(1, 3))));

      print(time);
      print(offset.substring(1, 3));
      time = intl.DateFormat.jm().format(now);
      isDayTime = now.hour < 6 && now.hour > 17 ? true : false;
    } catch (e) {
      print("WorldTime getData Error: " + e.toString());
      time = 'can not get date';
      offset = '';
    }
  }
}
