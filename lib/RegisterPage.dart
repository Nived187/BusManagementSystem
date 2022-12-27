import 'package:flutproj/DummyPage.dart';
import 'package:flutproj/page1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


void SignIn() async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString('id', id.text);
    sh.setString('password', pass.text);
}

  void Auth0(){

    if(id.text=='' || pass.text=='')
      {
        showDialog(context: context, builder: (context){return AlertDialog(content: Text('invalid credenetials try again'));} );
        name.clear();
      }
    else{
      SignIn();
      showDialog(context: context, builder: (context){return AlertDialog(content: Text('Registered Successsfully'));} );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>  page1()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("LOGIN"),),
    body: Column(children: [

      TextField(decoration : InputDecoration(hintText: 'Name'),controller: name,),
      TextField(decoration : InputDecoration(hintText: 'Place'),controller: place,),
      TextField(decoration : InputDecoration(hintText: 'choose an ID'),controller: id,),
      TextField(decoration : InputDecoration(hintText: 'choose a password'),obscureText: true,controller: pass,),
      ElevatedButton(onPressed: Auth0, child: Text('Register')),

    ],),);
  }
}
