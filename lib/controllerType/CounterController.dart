// CounterController.dart

import 'package:get/get.dart';

class CounterController extends GetxController {
  // Reactive variable to hold the count
  var count = 0.obs;

  // Singleton pattern to access the controller from anywhere
  static CounterController get to => Get.find();

  // Business logic methods
  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }
}