
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:practice_of_getx/main.dart';
import 'package:practice_of_getx/makingClassVarObservalbe/makingClassVarObservalbe.dart';
import '../makingClassVarObservalbe/tasks.dart';

class TaskController extends GetxController {
  // RxList of Task instances to store the list of tasks
  RxList<Task> tasks = <Task>[].obs;

  // TextEditingController for the task input field
  TextEditingController taskInputController = TextEditingController();

  // Function to add a new task
  void addTask(String taskName) {
    tasks.add(Task(name: taskName.obs, isCompleted: false.obs));
  }

  // Function to mark a task as completed or not completed
  void toggleTaskCompletion(int index) {
    tasks[index].isCompleted.value = !tasks[index].isCompleted.value;
  }

  // Function to remove a task
  void removeTask(int index) {
    tasks.removeAt(index);
  }
}