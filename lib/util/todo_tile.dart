import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
 final String taskName;
 final bool taskCompleted;
Function(bool?)? onChanged;
Function (BuildContext)? deleteFunction;

    TodoTile({super.key,
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged,
  required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
            )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.black,),
              Text(taskName, style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                decoration:taskCompleted ? TextDecoration.lineThrough : TextDecoration.none ),),
            ],
          ),
        decoration: BoxDecoration(color: Colors.blue[300],
        borderRadius: BorderRadius.circular(12)
        ),
        ),
      ),
    );
  }
}