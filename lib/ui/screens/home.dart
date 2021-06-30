import 'package:flutter/material.dart';
import 'package:world_time/data/services/world_time.dart';
import 'package:world_time/generated/assets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    WorldTime worldTime = data["worldTime"];
    print(worldTime.location);
    Color bgColor = worldTime.isDayTime ? Colors.blue : Colors.indigo;
    Color textColor = worldTime.isDayTime ? Colors.black : Colors.white;
    String bgImage =
        worldTime.isDayTime ? Assets.imagesDay : Assets.imagesNight;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(bgImage),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 130, 0, 10),
                      child: TextButton.icon(
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(
                              context, "/choose_location");
                          setState(() {
                            worldTime = result;
                            print("location" + worldTime.location);
                            print("time" + worldTime.time);
                          });
                        },
                        icon: Icon(Icons.add_location, color: textColor),
                        label: Text("Home", style: TextStyle(color: textColor)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(worldTime.location,
                    style: TextStyle(fontSize: 30, color: textColor)),
                SizedBox(height: 10.0),
                Text(worldTime.time,
                    style: TextStyle(fontSize: 50, color: textColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
