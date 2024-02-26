import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];
  Task? pinnedTask;

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void pinTask(Task task) {
    pinnedTask = task;
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
