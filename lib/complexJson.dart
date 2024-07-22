// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:my_project/models/user_model/user_model.dart';
import "package:http/http.dart" as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});
  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userList = [];

  Future<List<UserModel> getUsersApi() async{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  var data = jsonDecode(response.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User API"),
          centerTitle: true,
          backgroundColor: Colors.tealAccent,
        ),
        body: const SafeArea(
            child: Column(
          children: [],
        )),
      ),
    );
  }
}
