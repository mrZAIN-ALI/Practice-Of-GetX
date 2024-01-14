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
      title: 'GetX Bottom Sheet and Dynamic Theme',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeService().getThemeMode(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Bottom Sheet and Dynamic Theme'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(ThemeBottomSheet());
          },
          child: Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Select Theme:'),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ThemeService().setTheme(ThemeMode.light);
              Get.back();
            },
            child: Text('Light Theme'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              ThemeService().setTheme(ThemeMode.dark);
              Get.back();
            },
            child: Text('Dark Theme'),
            
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              ThemeService().setTheme(ThemeMode.system);
              Get.back();
            },
            child: Text('System Theme'),
          ),
        ],
      ),
    );
  }
}

class ThemeService extends GetxService {
  //default theme
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  //setting theme
  void setTheme(ThemeMode mode) {
    themeMode.value = mode;
    Get.changeThemeMode(mode);
  }
  //getting theme
  ThemeMode getThemeMode() => themeMode.value;
}
