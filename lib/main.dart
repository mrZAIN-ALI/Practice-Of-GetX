import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyController extends GetxController {
  // RxBool to make the variable reactive
  RxBool isSwitchOn = false.obs;
  // RxString name = 'John Doe'.obs;
  // Function to toggle the value of isSwitchOn
  void toggleSwitch() {
    isSwitchOn.value = !isSwitchOn.value;
  }
}

class MyApp extends StatelessWidget {
  final MyController controller = MyController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reactive Variable Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Obx widget to make the Text reactive
              Obx(() {
                return Text(
                  'Switch is ${controller.isSwitchOn.value ? 'ON' : 'OFF'}',
                  style: TextStyle(fontSize: 20),
                );
              }),

              SizedBox(height: 20),

              // Switch to toggle the reactive variable
              Obx(
                () => Switch(
                  activeColor: Colors.green,
                  value: controller.isSwitchOn.value,
                  onChanged: (value) {
                    // Call the function to toggle the value
                    controller.toggleSwitch();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
