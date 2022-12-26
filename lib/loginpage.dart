import 'package:flutproj/DummyPage.dart';
import 'package:flutproj/page1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

   var id1 = TextEditingController();
   var pass1 = TextEditingController();
   var user = '';
   bool? signed;


  void initState() {
      getSigned();
    if(signed == true)
      {

        Navigator.push(context, MaterialPageRoute(builder: (context)=>DummyPage()));
      }


  }

void getSigned() async{
  SharedPreferences sh =  await SharedPreferences.getInstance();
  if(sh.getString('id')== 'admin' && sh.getString('password')=='admin')
    {
      signed = true;


    }
  else{
     signed =false;
  }
}

void SignIn() async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString('id', 'admin');
    sh.setString('password', 'admin');
}


  void Auth0(){

    if(id1.text=='admin' && pass1.text=='admin')
      {
        SignIn();

        //showDialog(context: context, builder: (context){return AlertDialog(content: Text('ok'));} );
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  page1()));
        print('${id1.text} + ${pass1.text}');
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("LOGIN"),),
    body: Column(children: [

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
      TextField(decoration : InputDecoration(hintText: 'Enter ID'),controller: id1,),
      TextField(decoration : InputDecoration(hintText: 'Enter password'),obscureText: true,controller: pass1,),
      ElevatedButton(onPressed: Auth0, child: Text('Log In'))

    ],),);
  }
}
