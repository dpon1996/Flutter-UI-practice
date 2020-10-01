import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi/2,
      child: Container(
        height: 300,
        width: 300,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if(!mounted)return;
      setState(() {});
    });
  }
}

class ClockPainter extends CustomPainter {
  DateTime dateTime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xff444974);
    var outlineBrush = Paint()
      ..color = Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var centerFillBrush = Paint()..color = Color(0xffeaecff);
    var secHandBrush = Paint()
      ..color = Colors.orange[300]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xff748ef6), Color(0xff77ddff)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xffea74ab), Color(0xffc279fb)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);


    var hourHandX = centerX + 80 * cos((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);
    var hourHandY = centerX + 80 * sin((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
