import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/lolo.png'),
            SizedBox(height: 20),
            Text(
              'Contact information:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Wander Capellan \n20220826@itla.edu.do\n829-000-0000',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
c:\Users\wande\Downloads\lolo.pngc:\Users\wande\Downloads\lolo.png