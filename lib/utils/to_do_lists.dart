// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoLists extends StatelessWidget {
  final String titlee;
  bool isChecked = false;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoLists({
    Key? key,
    required this.titlee,
    required this.isChecked,
    this.onChanged,
    this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.tealAccent,
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(30.0),
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
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
