import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String quote = "";
  String author = "";
  String title = 'Quotes';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text(title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                quote,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "- $author",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // setState(() {
                //   title = 'Apple';
                // });

                var url = Uri.parse('https://api.quotable.io/random');
                var response = await http.get(url);
                print('Status Code: ${response.statusCode}');
                print('body: ${response.body}');
                var data = jsonDecode(response.body);
                quote = data['content'];
                author = data['authorSlug'];
                setState(() {});
              },
              child: const Text('Get Guote'),
            ),
          ],
        ),
      ),
    );
  }
}
