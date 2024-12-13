import 'package:flutter/material.dart';
import 'package:todo_app_ko/util/my_buttoon.dart';

class DialogBox extends StatelessWidget {
  final controller;

 VoidCallback onSave;
 VoidCallback onCancel;

   DialogBox({super.key, required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[500],
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                   hintText: "Add a new task"),
            ),
            Row(children: [     
             MyButton(text: "Save", onPressed: onSave),
             const SizedBox(width: 8),
             MyButton(text: "Cancel", onPressed: onCancel        ),
            ],)
          ],
        ),
      ),
    );
  }
}
