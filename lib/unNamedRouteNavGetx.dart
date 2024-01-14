// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Unnamed Routes Example',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the DetailsScreen using unnamed route
                Get.to(DetailsScreen());
              },
              child: Text('Go to Details Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the DetailsScreen using unnamed route
                Get.off(LengthScreen());
              },
              child: Text('Go to Length Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the HomeScreen
            Get.back();
          },
          child: Text('Go back to Home Screen'),
        ),
      ),
    );
  }
}

class LengthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Length Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the HomeScreen
            Get.defaultDialog(
                middleText:
                    "This is Length Screen You can't go back to Home Screen");
          },
          child: Text('Go back to Home Screen'),
        ),
      ),
    );
  }
}
