import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/models/user_model/user_model.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);
  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUsersApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    List<dynamic> data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      userList = data
          .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return userList;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("User API"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getUsersApi(),
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          } else {
                            return Card(
                              child: Column(children: [
                                Row(
                                  children: [
                                    const Text("Name"),
                                    Text(userList[index].name.toString()),
                                  ],
                                )
                              ]),
                            );
                          }
                        });
                  }),
            ),
          ],
        )),
      ),
    );
  }
}
