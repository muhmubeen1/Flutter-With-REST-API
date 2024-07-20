import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({Key? key}) : super(key: key);
  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<Photos> photosList = [];
  Future<List<Photos>> getPhotosApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photo = Photos(title: i['title'], url: i['url']);
        photosList.add(photo);
      }

      return photosList;
    } else {
      throw Exception("No Photos has found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Testing Photos"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getPhotosApi(),
              builder: (context, snapshot) {
                return ListView.builder(itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text("Hey There"),
                  );
                });
              })
        ],
      ),
    );
  }
}

class Photos {
  String title, url;

  Photos({required this.title, required this.url});
}
