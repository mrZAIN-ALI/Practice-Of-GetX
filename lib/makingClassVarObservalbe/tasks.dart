// Custom class representing a task
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Task {
  RxString name = ''.obs;
  RxBool isCompleted = false.obs;

  Task({required this.name, required this.isCompleted});
}
