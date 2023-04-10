import 'package:hive/hive.dart';

class ToDoDataBase {
  final _myBox = Hive.box("mybox");
  List tasksList = [];

  //1st time ever open App==============================
  void initialData() {
    tasksList = [
      ["Wake up 6:30AM", false],
      ["Do Excercise", false],
    ];
  }

  //Load Data or Save Data===============================

  void loadData() {
    tasksList = _myBox.get('Load');
  }

  //Update the Data================================
  void updateDataBase() {
    _myBox.put("ToDo Lists", tasksList);
  }
}
