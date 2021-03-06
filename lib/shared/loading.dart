import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFF1E6FF),
        child: Center(
          child: SpinKitSquareCircle(color: Color(0xFF6F35A5), size: 50.0),
        ));
  }
}
