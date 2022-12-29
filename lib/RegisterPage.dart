import 'dart:convert';
import 'dart:io';
import 'package:web_socket_channel/io.dart';
import 'package:flutproj/DummyPage.dart';
import 'package:flutproj/page1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var id = TextEditingController();
  var pass = TextEditingController();
  var name = TextEditingController();
  var place = TextEditingController();

  void SignIn() async {
    var response = await http.post(Uri.parse('http://localhost:3000'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': id.text,
          'pass': pass.text,
          'name': name.text,
          'place': place.text
        }));
    print(response.statusCode);
    // var msg = " ${id.text} ${pass.text} ${name.text} ";
    // sendMessage(msg);

    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString('id', id.text);
    sh.setString('password', pass.text);
  }

  // void sendMessage(msg) {
  //   IOWebSocketChannel? channel;

  //   try {
  //     channel = IOWebSocketChannel.connect('ws://localhost:3000');
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   channel?.sink.add(msg);

  //   channel?.stream.listen((event) {
  //     if (event!.isNotEmpty) {
  //       print(event);
  //       channel!.sink.close();
  //     }
  //   });
  // }

  void Auth0() {
    if (id.text == '' || pass.text == '') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text('invalid credenetials try again'));
          });
      name.clear();
    } else {
      SignIn();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text('Registered Successsfully'));
          });
      Navigator.push(context, MaterialPageRoute(builder: (context) => page1()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Name'),
            controller: name,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Place'),
            controller: place,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'choose an ID'),
            controller: id,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'choose a password'),
            obscureText: true,
            controller: pass,
          ),
          ElevatedButton(onPressed: Auth0, child: Text('Register')),
        ],
      ),
    );
  }
}
