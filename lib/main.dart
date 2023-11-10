import 'package:flutter/material.dart';
import 'package:to_do_app/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initialize Hive
  await Hive.initFlutter();

  //open box
  await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}
