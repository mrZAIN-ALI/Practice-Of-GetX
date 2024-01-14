import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call the showDialog function defined below
            showMyDialog();
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }

  void showMyDialog() {
    Get.defaultDialog(
      //
      title: 'Dialog Title',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      onCancel: () {
        print("Cancel");
      },
      onConfirm: () {
        print("Confirm");
      },
      buttonColor: Colors.green,
      // confirmTextColor: Color(colors),
      
      //
      content: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('This is a GetX dialog.'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Close the dialog when this button is pressed
              Get.back();
            },
            child: const Text('Close Dialog'),
          ),
        ],
      ),
    );
  }
}
