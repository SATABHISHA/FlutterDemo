import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  // const EmployeeDashboard({Key? key}) : super(key: key);
  static String id = 'EmployeeDashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(92, 76, 121, 1.0), title: Text('Dashboard', style: TextStyle(color: Colors.white, fontSize: 18.0),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Column(
                children: [
                  Icon()
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
            SizedBox(height: 10,),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2.0),
                border: Border.all(
                    color: Color.fromRGBO(190, 190, 190, 1),
                    width: 1),
              ),

            )
          ],
        ),
      ),
    );
  }
}
