// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/my_button.dart';

class FloatingDialong extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  FloatingDialong({
    Key? key,
    required this.onSave,
    required this.onCancel,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.tealAccent,
      content: Container(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new Task",
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Save Button
                MyButton(
                  texxt: "Save",
                  onChange: onSave,
                ),

                //Cancel Button
                MyButton(
                  texxt: "Cancel",
                  onChange: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
