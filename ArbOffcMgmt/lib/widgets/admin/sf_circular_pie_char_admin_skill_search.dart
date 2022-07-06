import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class SfCircularPieChartAdminSkillSearch extends StatelessWidget {
  // const SfCircularPieChart({Key? key}) : super(key: key);
  static String department = '';
  @override
  Widget build(BuildContext context) {
    final List<ChartDataSkillSearch> chartData = [
      ChartDataSkillSearch('Skill_1', 1 , Colors.lightBlueAccent),
      ChartDataSkillSearch('Skill_2', 2, Colors.lightGreenAccent),
    ];
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCircularChart(
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartDataSkillSearch, String>(
                          dataSource: chartData,
                          pointColorMapper:(ChartDataSkillSearch data,  _) => data.color,
                          xValueMapper: (ChartDataSkillSearch data, _) => data.x,
                          yValueMapper: (ChartDataSkillSearch data, _) => data.y,
                          dataLabelSettings: DataLabelSettings(
                            // Renders the data label
                              isVisible: true,
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
                              SfCircularPieChartAdminSkillSearch.department = 'skill1';
                              // Navigator.pushNamed(context, EmployeeList.id);

                            }if (details.pointIndex == 1){
                              SfCircularPieChartAdminSkillSearch.department = 'skill2';
                              // Navigator.pushNamed(context, EmployeeList.id);
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
class ChartDataSkillSearch {
  ChartDataSkillSearch(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}