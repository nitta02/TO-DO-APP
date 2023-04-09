// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/constants/tasks_constants.dart';
import 'package:to_do_app/utils/to_do_lists.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //checkbox==================
  void checkboxChecked(value, index) {
    setState(() {
      tasksList[index][1] = !tasksList[index][1];
    });
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
              onChanged: (value) => checkboxChecked(value, index),
            );
          },
        ));
  }
}
