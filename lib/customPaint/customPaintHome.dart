import 'package:animatedclockuichallenge/customPaint/clockView/animatedClock.dart';
import 'package:animatedclockuichallenge/customPaint/customBottomBar/customBottomBar.dart';
import 'package:animatedclockuichallenge/customPaint/customWaveAppBar/customWaveAppBar.dart';
import 'package:flutter/material.dart';

class CustomPaintHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CUSTOM PAINTER'),
        titleSpacing: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimatedClock(),
                ),
              );
            },
            title: Text('Animated Clock'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomBottomBar(),
                ),
              );
            },
            title: Text('Custom Bottom Bar'),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomWaveAppBar(),
                ),
              );
            },
            title: Text('Custom Wave App Bar'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
