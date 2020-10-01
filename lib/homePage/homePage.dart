import 'package:animatedclockuichallenge/customPaint/customPaintHome.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI STUDY'),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomPaintHome(),
                  ),
                );
              },
              title: Text('CUSTOM PAINTER'),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
