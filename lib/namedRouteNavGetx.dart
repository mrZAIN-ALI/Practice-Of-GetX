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
      title: 'GetX Named Routes Example',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/', // Root route
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/details', // Named route for DetailsScreen
          page: () => DetailsScreen(),
        ),
      ],
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
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the named route '/details'
            Get.toNamed('/details');
          },
          child: Text('Go to Details Screen'),
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
            // Navigate back to the root route '/'
            Get.offNamed('/');
          },
          child: Text('Go back to Home Screen'),
        ),
      ),
    );
  }
}
