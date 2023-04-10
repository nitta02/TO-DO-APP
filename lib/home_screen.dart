// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unused_field, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/utils/floating_action.dart';
import 'package:to_do_app/utils/to_do_lists.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    //=====================1st Time ==========================
    if (_myBox.get("TODOLIST") == null) {
      db.initialData();
    } else {
      //=================Load Data==================
      db.loadData();
    }
    super.initState();
  }

  void saveNewTask() {
    setState(() {
      db.tasksList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void creatNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return FloatingDialong(
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
          controller: _controller,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.tasksList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        title: const Text('TO-DO'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: db.tasksList.length,
        itemBuilder: (context, index) {
          return ToDoLists(
            deleteFunction: (context) => deleteTask(index),
            titlee: db.tasksList[index][0],
            isChecked: db.tasksList[index][1],
            onChanged: (value) {
              setState(() {
                db.tasksList[index][1] = !db.tasksList[index][1];
              });
              db.updateDataBase();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return creatNewTask();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
