import 'package:flutter/material.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});
  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Sign Up Api"),
            backgroundColor: Colors.amberAccent),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Email", prefixIcon: Icon(Icons.email)),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Password", prefixIcon: Icon(Icons.password)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
