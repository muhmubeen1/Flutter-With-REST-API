import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ProductsModel.dart';

class Finalexample extends StatefulWidget {
  const Finalexample({super.key});
  @override
  State<Finalexample> createState() => _FinalexampleState();
}

class _FinalexampleState extends State<Finalexample> {
  Future<ProductsModel> getProductsApi() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/f3e62a88-1e0e-4608-83fb-0ec0ad5337da'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return ProductsModel.fromJson(data);
    } else {
      throw Exception("Failed to get Data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Products Api"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<ProductsModel>(
                  future: getProductsApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData ||
                        snapshot.data!.data == null) {
                      return const Center(child: Text('No data available'));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 3,
                                width: MediaQuery.of(context).size.width * 1,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot
                                        .data!.data![index].images!.length,
                                    itemBuilder: (context, position) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                3,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                          snapshot.data!.data![index]
                                              .images![position].url
                                              .toString(),
                                        ))),
                                      );
                                    }),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
