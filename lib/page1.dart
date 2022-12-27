
import 'dart:convert';
import 'dart:html';
import 'package:flutproj/DummyPage.dart';
import 'package:flutproj/RegisterPage.dart';
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
  var user = '';

  void logUser()async
  {
    SharedPreferences sh = await SharedPreferences.getInstance();
    var regData0 = sh.getString('id');
    var regData1 = sh.getString('password');
    if(regData0 == id.text && regData1 == password.text)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DummyPage()));
      }
    else{
      AlertDialog(content: Text('no registered user'),);
    }



  }


  void RegRoute(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>(RegisterPage())));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('hey')),
      body: Container(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

        Row(
          children: [
            Text('Passenger'),
            Radio(value: 'passenger', groupValue: user , onChanged: ((value){setState(() {
              user=value!;
            }); })),
          ],
        ),

        Row(
          children: [
            Text('Driver'),
            Radio(value: 'Driver', groupValue: user , onChanged: ((value){setState(() {
              user=value!;
            }); })),
          ],
        ),
        TextField(decoration: InputDecoration(hintText: "Enter username "),controller: id,),
        TextField(decoration: InputDecoration(hintText: "Enter password "),controller : password),

        FloatingActionButton(onPressed: logUser,child: Icon(Icons.login),),

      ElevatedButton(onPressed: RegRoute, child: Text('Register')),


      ],),


      ),

    );
  }
}
