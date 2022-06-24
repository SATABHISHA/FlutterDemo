import 'package:flutter/material.dart';

class EmployeeDataList extends StatelessWidget {
  // const EmployeeDataList({Key? key}) : super(key: key);
  final name;
  EmployeeDataList({this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(name)],
    );
  }

}


