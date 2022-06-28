import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(
          itemBuilder: (context, index){
          return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              chekBoxCallback: (checkboxState){
                /* setState((){
            // isChecked = checkboxState;
            widget.tasks[index].toggleDone();
          });*/
              });
        }, itemCount: TaskData().taskCount,);
      }

    );
  }
}