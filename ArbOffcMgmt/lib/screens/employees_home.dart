import 'package:arb_offc/screens/hrskill/admin_dashboard.dart';
import 'package:arb_offc/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../widgets/sf_circular_pie_chart.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class EmployeesHome extends StatefulWidget {
  const EmployeesHome({Key? key}) : super(key: key);
  static String id = 'employees_home';

  @override
  State<EmployeesHome> createState() => _EmployeesHomeState();
}

class _EmployeesHomeState extends State<EmployeesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.lightBlueAccent,
      drawer: CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: (){
          /*showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context)=> SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen()),
              )
          );*/

        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: InkWell(
                      onTap: (){
                        print('Clicked');
                        _key.currentState!.openDrawer();
                      },
                      child: Icon(Icons.list, size: 30.0, color: Colors.lightBlueAccent,)
                  ),
                  backgroundColor: Colors.white,
                   radius: 30.0,),
                SizedBox(height: 10.0,),
                WavyAnimatedTextKit(text: ['Employee(s) Dashboard'],textStyle: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                // Text('12 Tasks', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w700),),

              ],

            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              // color: Colors.white,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              ),
              child: SfCircularPieChart(),
            ),
          )
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Arb Software India Pvt Ltd'),
          ),
          ListTile(
            title: const Text('HR Skill Management'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              Navigator.pushNamed(context, AdminDashboard.id);
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
