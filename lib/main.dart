import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Custom class representing a task
class Task {
  RxString name = ''.obs;
  RxBool isCompleted = false.obs;

  Task({required this.name, required this.isCompleted});
}

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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TaskController taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX State Management Example'),
        ),
        body: Column(
          children: [
            // Obx widget to make the ListView reactive to changes in tasks
            Expanded(
              child: Obx(() {
                
                return ListView.builder(
                  itemCount: taskController.tasks.length,
                  itemBuilder: (context, index) {
                    Task task = taskController.tasks[index];
                    return ListTile(
                      title: Text(task.name.value),
                      leading: Checkbox(
                        value: task.isCompleted.value,
                        onChanged: (value) {
                          // Call the function to toggle task completion
                          taskController.toggleTaskCompletion(index);
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Call the function to remove the task
                          taskController.removeTask(index);
                        },
                      ),
                    );
                  },
                );
              }),
            ),

            // Text field and button to add a new task
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: taskController.taskInputController,
                      onChanged: (value) {},
                      onSubmitted: (value) {
                        // Call the function to add a new task
                        taskController.addTask(value);
                        // Clear the text field
                        taskController.taskInputController.clear();
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter task',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Call the function to add a new task
                      taskController.addTask(taskController.taskInputController.text);
                      // Clear the text field
                      taskController.taskInputController.clear();
                    },
                    child: Text('Add Task'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
