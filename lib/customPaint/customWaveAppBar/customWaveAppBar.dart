import 'package:flutter/material.dart';

class CustomWaveAppBar extends StatefulWidget {
  @override
  _CustomWaveAppBarState createState() => _CustomWaveAppBarState();
}

class _CustomWaveAppBarState extends State<CustomWaveAppBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: CustomPaint(
              size: Size(size.width,size.height/2),
              painter: WavePaint(),
            ),
          ),
        ],
      ),
    );
  }
}

class WavePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.2, size.height, size.width * .3, size.height-50);
    path.quadraticBezierTo(size.width * 0.4, size.height - 80, size.width * .7, size.height);
    path.quadraticBezierTo(size.width * 0.8, size.height + 20, size.width, size.height-50);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
