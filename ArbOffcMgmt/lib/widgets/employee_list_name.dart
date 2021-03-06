import 'package:arb_offc/model/employee.dart';
import 'package:arb_offc/widgets/pie_chart.dart';
import 'package:arb_offc/widgets/sf_circular_pie_chart.dart';
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
            if(SfCircularPieChart.department == 'dotnet'){
              name = value.dotNet[index];
            }
            if(SfCircularPieChart.department == 'designer'){
              name = value.designer[index];
            }
            if(SfCircularPieChart.department == 'mobile'){
              name = value.mobile[index];
            }
            if(SfCircularPieChart.department == 'php'){
              name = value.php[index];
            }
            // final name = value.designer[index];
            return Text(name.name, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),);
            },itemCount: value.getCount(SfCircularPieChart.department)
      );

      },
    );

  }
}
