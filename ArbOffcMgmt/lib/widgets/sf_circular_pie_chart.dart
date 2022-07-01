import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../screens/employee_list.dart';

class SfCircularPieChart extends StatelessWidget {
  // const SfCircularPieChart({Key? key}) : super(key: key);
  static String department = '';
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('DotNet', 7 , Colors.red),
      ChartData('Php', 2, Colors.grey),
      ChartData('Mobile', 1, Colors.orangeAccent),
      ChartData('Designer', 2, Colors.limeAccent)
    ];
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCircularChart(
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                          dataSource: chartData,
                          pointColorMapper:(ChartData data,  _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          dataLabelSettings: DataLabelSettings(
                            // Renders the data label
                              isVisible: true
                          ),
                        onPointTap: (ChartPointDetails details) {
                          print(details.pointIndex);
                          // print(details.seriesIndex);
                          if (details.pointIndex == 1){
                            /* showModalBottomSheet(isScrollControlled: true,
                                context: context,
                                builder: (context)=> SingleChildScrollView(
                                  child: Container(
                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                      child: EmployeeDetailsScreen(departmentName: 'Designer', nameList: designerList,)),
                                )
                            );*/
                            SfCircularPieChart.department = 'designer';
                            Navigator.pushNamed(context, EmployeeList.id);

                          }if (details.pointIndex == 0){
                            SfCircularPieChart.department = 'dotnet';
                            Navigator.pushNamed(context, EmployeeList.id);
                          }if (details.pointIndex == 2){
                            SfCircularPieChart.department = 'mobile';
                            Navigator.pushNamed(context, EmployeeList.id);
                          }if (details.pointIndex == 3){
                            SfCircularPieChart.department = 'php';
                            Navigator.pushNamed(context, EmployeeList.id);
                          }
                        }
                      )
                    ]
                )
            )
        )
    );
  }
}
class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}