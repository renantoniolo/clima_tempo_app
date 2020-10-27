import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  final hourNow = new DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        hourNow > 18 || hourNow < 6
            ? "assets/images/bgNight.gif"
            : "assets/images/bgDay.gif",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
