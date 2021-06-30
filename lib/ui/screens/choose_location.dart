import 'package:flutter/material.dart';
import 'package:world_time/data/services/world_time.dart';
import 'package:world_time/generated/assets.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  bool isSplash = false;
  bool isVerify = false;
  bool isFirebaseToken = false;

  String time = '';
  List<WorldTime> worldTimeList = [
    WorldTime("Cairo", "", "Africa/Cairo"),
    WorldTime("London", "", "Europe/London"),
    WorldTime("Seoul", "", "Asia/Seoul"),
  ];

  void updateDataTime(index) async {
    await worldTimeList[index].getDate();
    Navigator.pop(context,worldTimeList[index]);
  }

  // void getData() async {
  //   Future.delayed(Duration(seconds: 3), () {
  //     isSplash = true;
  //   });
  //
  //   isFirebaseToken = await Future.delayed(Duration(seconds: 3), () {
  //     return true;
  //   });
  //
  //   isVerify = await Future.delayed(Duration(seconds: 2), () {
  //     return true;
  //   });
  //
  //   if (isSplash && isVerify && isVerify) {
  //     print("true");
  //   } else
  //     print("false");
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location"),
        centerTitle: true,
      ),
      body: ListView.builder(
          // separatorBuilder: (BuildContext context, int index) =>
          //     const Divider(),
          padding: const EdgeInsets.all(8),
          itemCount: worldTimeList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateDataTime(index);
                },
                title: Text('${worldTimeList[index].location}'),
                subtitle: Text(time),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Assets.imagesHigh),
                      radius: 28,
                    ),
                  ],
                ),
                trailing: Icon(Icons.menu),
              ),
            );
          }),
    );
  }
}
