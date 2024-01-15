import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllerType/CounterScreen.dart';
import 'controllerType/CounterController.dart';
void main() {
  //  Get.put(CounterController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX State Management',
      home: CounterScreen(),
    );
  }
}


