
import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class page1 extends StatefulWidget {
  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  //const page1({Key? key}) : super(key: key);
  Future<void> dummy()
  async {
    print('hey');

    var response = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),body: jsonEncode({'title':'title'}));
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('hey')),
      body: Container(child: Column(children: [


        TextField(decoration: InputDecoration(hintText: "Enter Name "),),
        TextField(decoration: InputDecoration(hintText: "Enter Place "),),
        TextField(decoration: InputDecoration(hintText: "Enter  "),),

        FloatingActionButton(onPressed: dummy,child: Icon(Icons.add),),


      ],),


      ),

    );
  }
}
