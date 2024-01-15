import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:practice_of_getx/main.dart';
import '../makingClassVarObservalbe/TaskController.dart';
import '../makingClassVarObservalbe/tasks.dart';
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
