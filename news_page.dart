import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List _news = [];

  void _fetchNews() async {
    final response = await http.get(Uri.parse('https://api.mhthemes.com/v1/posts?limit=3'));

    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _news = data['items'];
      });
    } else {
      print('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _fetchNews,
              child: Text('Fetch News'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _news.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_news[index]['title']),
                    subtitle: Text(_news[index]['summary']),
                    onTap: () {
                      launch(_news[index]['link']);
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
