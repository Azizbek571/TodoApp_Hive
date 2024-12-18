import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_ko/data/database.dart';
import 'package:todo_app_ko/util/dialog_box.dart';
import 'package:todo_app_ko/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


final _myBox = Hive.box('mybox');


final _controller = TextEditingController();

ToDoDataBase db = ToDoDataBase();

@override
  void initState() {
    
   if (_myBox.get("TODOLIST") == null){
    db.createInitialData();
   }else{
      db.loadData();
   }


    super.initState();
  }

//  List toDoList = [
//   ["Make a plan", false],
//   ["Go jogging", false]
//  ];

 void checkBoxChanged(bool? value, int index){
  setState(() {
     db.toDoList[index][1] = !db.toDoList[index][1];
  });
  db.updateDataBase();
 }

 void saveNewTask(){
  setState(() {
    db.toDoList.add([_controller.text, false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
  db.updateDataBase();

 }


 void createNewTask(){
  showDialog(context: context, builder: (context){
    return DialogBox(
controller: _controller,
onSave: saveNewTask,
onCancel: () => Navigator.of(context).pop(),

    );
  });
 }

 void deleteTask(int index){
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDataBase();

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
     appBar: AppBar(
      backgroundColor: Colors.blue[400],
      
      title: 
    
       Center(child: Text('Your TODO List')),
      elevation: 0,
     ),
    floatingActionButton: FloatingActionButton(onPressed: createNewTask,
    backgroundColor: Colors.blue[600],
    child: Icon(Icons.add),
    ),
     body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0], 
          taskCompleted: db.toDoList[index][1], 
          onChanged:(value) => checkBoxChanged(value, index),
          deleteFunction: (context) => deleteTask(index),
          );
        },
      
      ),
    );
  }
}