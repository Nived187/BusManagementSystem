
import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class page1 extends StatefulWidget {
  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  //const page1({Key? key}) : super(key: key);

  var id = TextEditingController();
  var password = TextEditingController();

  Future<void> dummy()
  async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    var name = sh.getString('password');
    print('$name');

    // var response = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),body: jsonEncode({'title':'title'}));
    // print(response.statusCode);
  }

  void resgUser()async
  {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString('id', id.text);
    sh.setString('password', password.text);

  }

  void TextDisp()
  {
    print(id.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('hey')),
      body: Container(child: Column(children: [


        TextField(decoration: InputDecoration(hintText: "Enter username "),controller: id,),
        TextField(decoration: InputDecoration(hintText: "Enter password "),controller : password),
        TextField(decoration: InputDecoration(hintText: "Enter  "),),

        FloatingActionButton(onPressed: dummy,child: Icon(Icons.display_settings),),
        FloatingActionButton(onPressed: resgUser,child: Icon(Icons.add),),
        FloatingActionButton(onPressed: TextDisp,child: Icon(Icons.settings),),


      ],),


      ),

    );
  }
}
