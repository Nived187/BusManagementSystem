import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

   var id1 = TextEditingController();
   var pass1 = TextEditingController();
  void Auth0(){

    if(id1.text=='n' && pass1.text=='1')
      {
        print('hey');
        showDialog(context: context, builder: (context){return AlertDialog(content: Text('ok'));} );

      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("LOGIN"),),
    body: Column(children: [

      TextField(decoration : InputDecoration(hintText: 'Enter ID'),controller: id1,),
      TextField(decoration : InputDecoration(hintText: 'Enter password'),obscureText: true,controller: pass1,),
      ElevatedButton(onPressed: Auth0, child: Text('Log In'))

    ],),);
  }
}
