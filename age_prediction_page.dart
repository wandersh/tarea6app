import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgePredictionPage extends StatefulWidget {
  @override
  _AgePredictionPageState createState() => _AgePredictionPageState();
}

class _AgePredictionPageState extends State<AgePredictionPage> {
  TextEditingController _controller = TextEditingController();
  int _age = 0;
  String _category = '';
  String _imageUrl = '';

  void _predictAge() async {
    final response = await http.get(Uri.parse('https://api.agify.io/?name=${_controller.text}'));
    final data = json.decode(response.body);
    setState(() {
      _age = data['age'];
      if (_age < 18) {
        _category = 'Young';
        _imageUrl = 'assets/images/young.jpg';
      } else if (_age < 60) {
        _category = 'Adult';
        _imageUrl = 'assets/images/adult.jpg';
      } else {
        _category = 'Senior';
        _imageUrl = 'assets/images/senior.jpg';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Prediction'),
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
              onPressed: _predictAge,
              child: Text('Predict Age'),
            ),
            SizedBox(height: 20),
            Text(
              _age > 0 ? 'Age: $_age' : '',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _category,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            _imageUrl.isNotEmpty ? Image.asset(_imageUrl) : Container(),
          ],
        ),
      ),
    );
  }
}
