import 'package:flutter/material.dart';

class EmployeesHome extends StatelessWidget {
  const EmployeesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(child: Icon(Icons.list, size: 30.0, color: Colors.lightBlueAccent,), backgroundColor: Colors.white, radius: 30.0,),
                SizedBox(height: 10.0,),
                Text('Employee(s) Dashboard', style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.w700),),
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
            ),
          )
        ],
      ),
    );
  }
}
