import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api/score.dart';
import 'package:flutter_api/test.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final nameController = TextEditingController();
void dispose() {
  nameController.dispose();
}

class _HomePageState extends State<HomePage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 24,
        leading: Icon(
          Icons.sports_cricket_outlined,
          color: Colors.black54,
          size: 40,
        ),
        centerTitle: true,
        title: Text("Cricket Api"),
        backgroundColor: Color(0xffe0ac9d),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xfff8edeb),
        ),
        child: Column(
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  enableSuggestions: true,
                  controller: nameController,
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    labelText: 'Name',
                    enabled: true,
                    fillColor: Colors.red,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        width: 24,
                        color: Colors.red,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (nameController.text != "")
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => test(nameController.text),
                        ),
                      );
                    print(flag);
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.cyan),
                  child: Text(
                    "Show",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Expanded(child: Image.asset('assets/cc.png'),flex: 1,)
          ],
        ),
      ),
    );
  }
}
