import 'package:flutter/material.dart';
import 'package:tarea6app/pages/gender_prediction_page.dart';
import 'package:tarea6app/pages/age_prediction_page.dart';
import 'package:tarea6app/pages/university_list_page.dart';
import 'package:tarea6app/pages/weather_page.dart';
import 'package:tarea6app/pages/news_page.dart';
import 'package:tarea6app/pages/about_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea6App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea6App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/toolbox.jpg'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GenderPredictionPage()));
              },
              child: Text('Predict Gender'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AgePredictionPage()));
              },
              child: Text('Predict Age'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UniversityListPage()));
              },
              child: Text('List Universities'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherPage()));
              },
              child: Text('Weather in RD'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewsPage()));
              },
              child: Text('Latest News'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
              },
              child: Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}
