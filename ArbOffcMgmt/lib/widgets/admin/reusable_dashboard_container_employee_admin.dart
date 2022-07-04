import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusableDashboardContainer extends StatelessWidget {
  VoidCallback dashboardOnPressed;
  final String employeeDashboardTitle;
  /*const ReusableDashboardContainer({
    Key? key,
  }) : super(key: key);*/
  ReusableDashboardContainer({required this.dashboardOnPressed, required this.employeeDashboardTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: dashboardOnPressed,
      child: Container(
        height: 200,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(FontAwesomeIcons.android, size: 100, ),
            SizedBox(height: 20,),
            Container(
              width: 200,
              height: 30,
              child: Center(child: Text('$employeeDashboardTitle', style: TextStyle(color: Colors.white, fontSize: 13),)),
              decoration: BoxDecoration(color: Color.fromRGBO(92, 76, 121, 1.0)),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
              color: Color.fromRGBO(190, 190, 190, 1),
              width: 1),
        ),

      ),
    );
  }
}