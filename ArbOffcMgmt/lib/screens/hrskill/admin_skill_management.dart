import 'package:flutter/material.dart';


class AdminSkillManagement extends StatelessWidget {
  static String id = 'AdminSkillManagement';
  // const AdminSkillManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(92, 76, 121, 1.0), title: Text('Skill Management', style: TextStyle(color: Colors.white, fontSize: 18.0),),),
    );
  }
}
