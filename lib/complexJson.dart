import 'package:flutter/material.dart';

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);
  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("User API"),
          centerTitle: true,
          backgroundColor: Colors.tealAccent,
        ),
        body: SafeArea(
            child: Column(
          children: [],
        )),
      ),
    );
  }
}
