import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('images/bottamBar.png'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width,80),
                    painter: CustomBottomBarPaint(),
                  ),
                  Center(
                    heightFactor: .7,
                    child: FloatingActionButton(
                      child: Icon(Icons.add),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(icon: Icon(Icons.home,color: Colors.blue,), onPressed: (){}),
                        IconButton(icon: Icon(Icons.category,color: Colors.grey,), onPressed: (){}),
                        SizedBox(width: size.width * 0.20),
                        IconButton(icon: Icon(Icons.search,color: Colors.grey,), onPressed: (){}),
                        IconButton(icon: Icon(Icons.person,color: Colors.grey,), onPressed: (){}),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBottomBarPaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.10, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),radius: Radius.circular(20),clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.90, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path,paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
   return false;
  }
}
