import 'package:arb_offc/screens/hrskill/admin_skill_management.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/admin/reusable_dashboard_container_employee_admin.dart';

class AdminDashboard extends StatelessWidget {
  // const EmployeeDashboard({Key? key}) : super(key: key);
  static String id = 'EmployeeDashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(92, 76, 121, 1.0), title: Text('Dashboard', style: TextStyle(color: Colors.white, fontSize: 18.0),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ReusableDashboardContainer(dashboardOnPressed: (){
              print('Clicked');
              Navigator.pushNamed(context, AdminSkillManagement.id);
            },employeeDashboardTitle: 'Skill Management'),
            SizedBox(height: 10,),
            ReusableDashboardContainer(dashboardOnPressed: (){
              print('Clicked');
            },employeeDashboardTitle: 'Personal Data Management',)
          ],
        ),
      ),
    );
  }
}


