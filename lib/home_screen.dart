// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/constants/tasks_constants.dart';
import 'package:to_do_app/utils/floating_action.dart';
import 'package:to_do_app/utils/to_do_lists.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  //checkbox==================
  // void checkboxChecked(value, index) {
  //   setState(() {
  //     tasksList[index][1] = !tasksList[index][1];
  //   });
  // }

  void creatNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return FloatingDialong(
          onCancel: () => Navigator.of(context).pop(),
          onSave: () {
            setState(() {
              tasksList.add([_controller.text, false]);
              Navigator.of(context).pop();
            });
          },
          controller: _controller,
        );
      },
    );
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
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          return ToDoLists(
            titlee: tasksList[index][0],
            isChecked: tasksList[index][1],
            onChanged: (value) {
              setState(() {
                tasksList[index][1] = !tasksList[index][1];
              });
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
