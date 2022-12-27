
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({Key? key}) : super(key: key);

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {

  void deReg() async{

    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.remove('id');
    sh.remove('password');
    AlertDialog(content: Text('removed'),);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(child: Text('OK'),),
      Center(child: ElevatedButton(onPressed: deReg, child: Icon(Icons.remove),)),
    ],

    );
  }
}
