import 'package:arb_offc/data/employee_data.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  // const EmployeeDetailsScreen({Key? key}) : super(key: key);
  String departmentName;
  List<EmployeeDataList> nameList = [];
  EmployeeDetailsScreen({required this.departmentName, required this.nameList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      // color: Colors.red,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        ),
        child: Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('$departmentName', style: TextStyle(fontSize: 30.0, color: Colors.lightBlue),textAlign: TextAlign.center,),
               Container(
                 height: 100,
                 child: ListView(
                   children: nameList,
                 ),
               )
                 ],
               ),
        ),
      ),
    );
  }
}
