import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _weather = '';

  void _fetchWeather() async {
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Santo%20Domingo&appid=YOUR_API_KEY'));
    final data = json.decode(response.body);
    setState(() {
      _weather = data['weather'][0]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather in RD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            Text(
              _weather.isNotEmpty ? 'Weather: $_weather' : '',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
