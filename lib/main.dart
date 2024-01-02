import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() {
    counter++;
  }

  void decrement() {
    counter--;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CounterController>(
                init: CounterController(),
                builder: (controller) {
                  return Text(
                    'Count: ${controller.counter}',
                    style: TextStyle(fontSize: 24),
                  );
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.find<CounterController>().increment();
                    },
                    child: Text('Increment'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Get.find<CounterController>().decrement();
                    },
                    child: Text('Decrement'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
