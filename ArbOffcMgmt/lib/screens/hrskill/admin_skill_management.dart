import 'package:flutter/material.dart';

import '../../widgets/admin/reusable_rounded_button_admin_skill.dart';


class AdminSkillManagement extends StatelessWidget {
  static String id = 'AdminSkillManagement';
  // const AdminSkillManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(92, 76, 121, 1.0), title: Text('Skill Management', style: TextStyle(color: Colors.white, fontSize: 18.0),),),
      body: Stack(
        children: [
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(70, 0, 70, 20),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(child: Text('Back', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)),
              decoration: BoxDecoration(
                color: Color.fromRGBO(217, 216 , 216, 1.0),
                borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundedButtonAdminSkillWidget(onPressed: (){}, title: 'Add Skill Level',),
              SizedBox(height: 20,),
              RoundedButtonAdminSkillWidget(onPressed: (){}, title: 'Add Skill',),
              SizedBox(height: 20,),
              RoundedButtonAdminSkillWidget(onPressed: (){}, title: 'Search Skill',)
            ],
          )
        ],
      ),
    );
  }
}


