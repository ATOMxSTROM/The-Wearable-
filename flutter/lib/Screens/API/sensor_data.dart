import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List<dynamic> users = [];
  void fetchUser() async {
    print("Called");
    const url =
        "https://datausa.io/api/data?drilldowns=Nation&measures=Population";

    final response = await get(Uri.parse(url));
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    //fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: fetchUser),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final year = user["Year"];
          final population = user["Population"];

          Column(
            children: [
              ListTile(
                title: Text(population),
              ),
              ListTile(
                title: Text(year, style: const TextStyle(fontSize: 12)),
              ),
            ],
          );
        },
      ),
    );
  }
}
