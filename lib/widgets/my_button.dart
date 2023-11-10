// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String texxt;
  VoidCallback onChange;
  MyButton({
    Key? key,
    required this.texxt,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onChange,
        color: Theme.of(context).primaryColor,
        child: Text(texxt));
  }
}
