import 'package:arb_offc/screens/employee_list.dart';
import 'package:arb_offc/screens/employees_home.dart';
import 'package:arb_offc/screens/hrskill/admin_dashboard.dart';
import 'package:arb_offc/screens/hrskill/admin_searching_screen1.dart';
import 'package:arb_offc/screens/hrskill/admin_skill_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/employee_department_list.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeeDepartmentList(),
      child: MaterialApp(
        home: EmployeesHome(),
        initialRoute: EmployeesHome.id,
        routes: {
          EmployeesHome.id : (context)=>EmployeesHome(),
          EmployeeList.id: (context)=>EmployeeList(),
          AdminDashboard.id: (context)=>AdminDashboard(),
          AdminSkillManagement.id: (context)=> AdminSkillManagement(),
          SearchSkillByAdmin.id: (context)=> SearchSkillByAdmin()
        },
      ),
    );
  }
}