import 'package:arb_offc/model/employee.dart';
import 'package:arb_offc/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:arb_offc/data/employee_department_list.dart';
import 'package:arb_offc/model/employee.dart';
import 'package:arb_offc/data/employee_data.dart';

class EmployeeListName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeDepartmentList>(
      builder: (context, value, child) {
      return ListView.builder(
          itemBuilder: (context, index){
            var name;
            if(PieChartDataDemo.department == 'dotnet'){
              name = value.dotNet[index];
            }
            if(PieChartDataDemo.department == 'designer'){
              name = value.designer[index];
            }
            if(PieChartDataDemo.department == 'mobile'){
              name = value.mobile[index];
            }
            if(PieChartDataDemo.department == 'php'){
              name = value.php[index];
            }
            // final name = value.designer[index];
            return Text(name.name, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
            },itemCount: value.getCount(PieChartDataDemo.department)
      );

      },
    );

  }
}
