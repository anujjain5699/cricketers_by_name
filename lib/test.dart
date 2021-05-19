import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_api/score.dart';

class test extends StatefulWidget {
  final String name;
  test(
    this.name,
  );
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  Future<List<Datum>> fetchData(String name) async {
    List<Datum> list;
    var response = await http.get(
      Uri.parse(
          "https://cricapi.com/api/playerFinder?apikey=QVs3QrnN33atkdcX7Godd87YcOE3&name=${name}"),
    );
    // print("response : "+response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var rest = data["data"] as List;
      print(rest);
      list = rest.map<Datum>((json) => Datum.fromMap(json)).toList();
    }
    //print("List Datum Size : ${list.length}");
    // var newData = Welcome.fromMap(data);
    // List<Datum> l = newData.data;
    //print(list["fullname"]);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          centerTitle: true,
          backgroundColor: Color(0xffCE8147),
          title: Text(
            '${widget.name.toUpperCase()}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            //color: Colors.grey,
            shape: BoxShape.rectangle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment
                  .bottomRight, // 10% of the width, so there are ten blinds.
              colors: [
                const Color(0xffCEB7B3),
                const Color(0xff76c893)
              ], // red to yellow
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.red,
                blurRadius: 12.0,
                spreadRadius: 4.0,
              ),
              BoxShadow(
                color: Colors.greenAccent,
                blurRadius: 12.0,
                spreadRadius: 4.0,
              ),
            ],
          ),
          child: FutureBuilder(
            future: fetchData(widget.name),
            builder: (context, snapshot) {
              return snapshot.data != null
                  ? listViewWidget(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget listViewWidget(List<Datum> datum) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: datum.length,
      itemBuilder: (context, index) {
        return Card(
          color: Color(0xff98c1d9),
          elevation: 24,
          shadowColor: Colors.black,
          child: ListTile(
            selected: true,
            leading: Icon(
              Icons.sports_cricket_outlined,
              color: Colors.black45,
              size: 36,
            ),
            shape: Border.all(
                color: Colors.brown, width: 23, style: BorderStyle.solid),
            title: Text(
              '${datum[index].fullName}',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
