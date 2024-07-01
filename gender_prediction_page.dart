import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenderPredictionPage extends StatefulWidget {
  @override
  _GenderPredictionPageState createState() => _GenderPredictionPageState();
}

class _GenderPredictionPageState extends State<GenderPredictionPage> {
  TextEditingController _controller = TextEditingController();
  String _gender = '';
  Color _color = Colors.white;

  void _predictGender() async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=${_controller.text}'));
    final data = json.decode(response.body);
    setState(() {
      _gender = data['gender'];
      _color = _gender == 'male' ? Colors.blue : Colors.pink;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _predictGender,
              child: Text('Predict Gender'),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 100,
              color: _color,
              child: Center(
                child: Text(
                  _gender.isNotEmpty ? 'Gender: $_gender' : '',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
