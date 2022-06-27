import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/screens/add_task_screen.dart';
import '../models/task.dart';


class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  // const TaskScreen({Key? key}) : super(key: key);
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  Widget buildButtomSheet(BuildContext context){
    return Container(
      child: Center(
        child: Text('This is a bottom sheet'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: (){
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context)=> SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen((newTaskTitle){
                        print(newTaskTitle);
                        setState((){
                          tasks.add(Task(name: newTaskTitle));
                        });
                      Navigator.pop(context);
                      }),),
              )
          );

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
                Text('ToDoList', style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.w700),),
                Text('${tasks.length} Tasks', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w700),),
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
              child: TaskList(tasks: tasks,),
            ),
          )
        ],
      ),
    );
  }
}




