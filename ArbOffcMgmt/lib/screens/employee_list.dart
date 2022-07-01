import 'package:arb_offc/screens/employees_home.dart';
import 'package:flutter/material.dart';

import '../data/employee_data.dart';
import '../widgets/employee_list_name.dart';
import 'package:provider/provider.dart';


class EmployeeList extends StatelessWidget {
  static String id = 'employee_list';
  // const EmployeeList({Key? key}) : super(key: key);
  // String departmentName;
  // List<EmployeeDataList> nameList = [];
  // EmployeeList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
         title: Text('Employee List', style: TextStyle(fontSize: 20),),
         leading:IconButton(
       icon: Icon(Icons.arrow_back_ios, color: Colors.redAccent),
       onPressed: () => Navigator.of(context).pop(),
     )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Expanded(
             child: Center(
               child: Container(
                 height: 200,
                 child: EmployeeListName(),
               ),
             ),
           )
         ],
        ),
      ),

    );
  }
}
