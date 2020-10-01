import 'package:animatedclockuichallenge/customPaint/clockView/clockView.dart';
import 'package:flutter/material.dart';

class AnimatedClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color(0xff2d2f41),
      child: ClockView(),
    );
  }
}
