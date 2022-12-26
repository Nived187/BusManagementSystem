import 'package:flutproj/DummyPage.dart';
import 'package:flutproj/page1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginpage.dart';

Future<void> main() async {

  Widget _default = new DummyPage();

  if(await CheckLogged()){
    _default = new DummyPage();
  }
  else{
    _default = new page1();
  }

  runApp(new MaterialApp(title: 'app',
          home: _default,));
}

Future<bool> CheckLogged() async{
  SharedPreferences sh = await SharedPreferences.getInstance();
  var user = sh.getString('id');
  var pass = sh.getString('password');
  if(user != null && pass != null)
    {
      return true;
    }
  else {
    return false;
  }
}

//https://medium.com/@anilcan/how-to-use-dynamic-home-page-in-flutter-83080da07012

