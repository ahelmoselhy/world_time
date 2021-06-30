import 'package:flutter/material.dart';
import 'package:world_time/data/services/world_time.dart';
import 'package:world_time/widgets/custom_loading.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading';
  bool loading = true;

  void setUpTime() async {
    WorldTime worldTime = WorldTime("Cairo", "", "Africa/Cairo");
    await worldTime.getDate();
    Navigator.pushReplacementNamed(context, "/home",
        arguments: {"worldTime": worldTime});
    // print(worldTime.dateTime);
    setState(() {
      loading = false;
      // time = worldTime.dateTime;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpTime();
  }

  // Wrap, RichText , clipRRect , MediaQuery ,FutureBuilder ,Flexible(Expand),SizedBox ,Align,FittedBox ,LayoutBuilder
  // InkWell,AnimatedIcon,AnimatedContainer ,SnackBar,Extensions ,Intro Screen,CircleAvatar,StatusBarColor,NavigationBarColor,
  // extendBodyBehindAppBar,,SliverAppBar,cupertino widgets,Platform.isAndroid,GoogleFonts,SelectableText,Hero,
  // debugPrint ,single responsibility widget ,null aware operator ?? , Lint ,launcher icon ,interactive viewr
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(time),
                SizedBox(
                  height: 8.0,
                ),
                CustomLoading(loading: loading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
