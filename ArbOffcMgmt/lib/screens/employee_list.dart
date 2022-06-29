import 'package:arb_offc/screens/employees_home.dart';
import 'package:flutter/material.dart';

import '../data/employee_data.dart';

class EmployeeList extends StatelessWidget {
  // const EmployeeList({Key? key}) : super(key: key);
  // String departmentName;
  List<EmployeeDataList> nameList = [];
  EmployeeList(this.nameList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
         title: Text('Employee List', style: TextStyle(fontSize: 12),),
         leading:IconButton(
       icon: Icon(Icons.arrow_back_ios, color: Colors.redAccent),
       onPressed: () => Navigator.of(context).pop(),
     )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Container(
           child: ListView(
             children: nameList,
           ),
         )
       ],
      ),

    );
  }
}
