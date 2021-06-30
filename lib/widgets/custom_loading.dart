import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinKit;

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    required this.loading,
  });

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: loading,
      child: spinKit.SpinKitDoubleBounce(
        color: Colors.red,
        size: 30.0,
        duration: Duration(seconds: 5),
      ),
    );
  }
}
