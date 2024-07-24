import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'component.dart';

class Examplefour extends StatefulWidget {
  const Examplefour({super.key});
  @override
  State<Examplefour> createState() => _ExamplefourState();
}

class _ExamplefourState extends State<Examplefour> {
  var data;
  Future<void> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User x Models"),
          backgroundColor: Colors.limeAccent,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ReuseableRow(
                                  title: 'Name', value: data[index]['name']),
                              ReuseableRow(
                                  title: 'Email', value: data[index]['email']),
                              ReuseableRow(
                                  title: 'Address',
                                  value: data[index]['address']['city']),
                            ],
                          ),
                        );
                      },
                    );
                  }),
            )
          ],
        )),
      ),
    );
  }
}
