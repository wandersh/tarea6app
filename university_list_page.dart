import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class UniversityListPage extends StatefulWidget {
  @override
  _UniversityListPageState createState() => _UniversityListPageState();
}

class _UniversityListPageState extends State<UniversityListPage> {
  TextEditingController _controller = TextEditingController();
  List _universities = [];

  void _fetchUniversities() async {
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=${_controller.text}'));
    final data = json.decode(response.body);
    setState(() {
      _universities = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universities by Country'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter country name in English'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchUniversities,
              child: Text('Fetch Universities'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _universities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_universities[index]['name']),
                    subtitle: Text(_universities[index]['web_pages'][0]),
                    onTap: () {
                      launch(_universities[index]['web_pages'][0]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
