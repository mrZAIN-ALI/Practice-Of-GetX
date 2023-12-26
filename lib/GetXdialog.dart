import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call the showDialog function defined below
            showMyDialog();
          },
          child: Text('Show Dialog'),
        ),
      ),
    );
  }

  void showMyDialog() {
    Get.defaultDialog(
      title: 'Dialog Title',
      content: Column(
        children: [
          Text('This is a GetX dialog.'),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Close the dialog when this button is pressed
              Get.back();
            },
            child: Text('Close Dialog'),
          ),
        ],
      ),
    );
  }
}
