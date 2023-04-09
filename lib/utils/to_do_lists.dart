// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_const_constructors
import 'package:flutter/material.dart';

class ToDoLists extends StatelessWidget {
  final String titlee;
  bool isChecked = false;
  Function(bool?)? onChanged;
  ToDoLists({
    Key? key,
    required this.titlee,
    required this.isChecked,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            //Check-Box Part
            Checkbox(
              activeColor: Colors.black,
              value: isChecked,
              onChanged: onChanged,
            ),

            //Title Part
            Text(
              titlee,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
