import 'dart:html';

import 'package:arb_offc/data/employee_department_list.dart';
import 'package:arb_offc/screens/employee_details.dart';
import 'package:arb_offc/screens/employee_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:arb_offc/data/employee_data.dart';
import 'package:provider/provider.dart';

class PieChartDataDemo extends StatefulWidget {
  // const PieChartDataDemo({Key? key}) : super(key: key);
 static String department = '';
  @override
  State<PieChartDataDemo> createState() => _PieChartDataDemoState();
}

class _PieChartDataDemoState extends State<PieChartDataDemo> {
  int touchedIndex = -1;
  bool absorbingStatus = false;


  @override
  Widget build(BuildContext context) {
    /*List<EmployeeDataList> designerList = [];
    designerList.add(EmployeeDataList(name: 'Abhishek Aich'));
    designerList.add(EmployeeDataList(name: 'Ramen',));

    List<EmployeeDataList> phpList = [];
    phpList.add(EmployeeDataList(name: 'Abc',));
    phpList.add(EmployeeDataList(name: 'def',));

    List<EmployeeDataList> dotNetList = [];
    dotNetList.add(EmployeeDataList(name: 'Arup Dutta',));
    dotNetList.add(EmployeeDataList(name: 'Manish',));
    dotNetList.add(EmployeeDataList(name: 'Amrit Maity',));
    dotNetList.add(EmployeeDataList(name: 'Partha Pratim',));
    dotNetList.add(EmployeeDataList(name: 'Amit',));
    dotNetList.add(EmployeeDataList(name: 'Kola',));
    dotNetList.add(EmployeeDataList(name: 'Jol Doshyu',));

    List<EmployeeDataList> mobileList = [];
    mobileList.add(EmployeeDataList(name: 'Satabhisha Roy',));*/

    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            absorbingStatus = false;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                          if (touchedIndex == 0){
                            /* showModalBottomSheet(isScrollControlled: true,
                                context: context,
                                builder: (context)=> SingleChildScrollView(
                                  child: Container(
                                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                      child: EmployeeDetailsScreen(departmentName: 'Designer', nameList: designerList,)),
                                )
                            );*/
                            absorbingStatus = false;
                            PieChartDataDemo.department = 'designer';
                            Navigator.pushNamed(context, EmployeeList.id);

                          }if (touchedIndex == 1){
                            absorbingStatus = false;
                            PieChartDataDemo.department = 'dotnet';
                            Navigator.pushNamed(context, EmployeeList.id);
                          }if (touchedIndex == 2){
                            absorbingStatus = false;
                            PieChartDataDemo.department = 'mobile';
                            Navigator.pushNamed(context, EmployeeList.id);
                          }if (touchedIndex == 3){
                            absorbingStatus = false;
                            PieChartDataDemo.department = 'php';
                            Navigator.pushNamed(context, EmployeeList.id);
                          }
                        });
                        print(touchedIndex);
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 0,
                      sections: showingSections()
                      ),
                  ),
                ),
              ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
               /* (
                  color: Color(0xff0293ee),
                  text: 'First',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'Second',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff845bef),
                  text: 'Third',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: 'Fourth',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),*/
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );

}
  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      // final fontSize = isTouched ? 25.0 : 16.0;
      final fontSize = isTouched ? 16.0 : 16.0;
      // final radius = isTouched ? 180.0 : 150.0;
      final radius = isTouched ? 150.0 : 150.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 2,
            title: '2%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 7,
            title: '7%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 1,
            title: '1%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 2,
            title: '2%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}