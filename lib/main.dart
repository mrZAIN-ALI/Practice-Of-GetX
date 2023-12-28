import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx Bottom Sheet and Dynamic Theme',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeService().theme.value,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                height: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Bottom Sheet Content'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text('Show Bottom Sheet'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ThemeService().toggleTheme();
        },
        child: Icon(Icons.lightbulb_outline),
      ),
    );
  }
}
//class to manage theme of app
// class ThemeService extends GetxController {

//   var theme = ThemeMode.system.obs;

//   void toggleTheme() {
//     if (theme.value == ThemeMode.light) {
//       theme.value = ThemeMode.dark;
//     } else if (theme.value == ThemeMode.dark) {
//       theme.value = ThemeMode.system;
//     } else {
//       theme.value = ThemeMode.light;
//     }

//     Get.changeThemeMode(theme.value);
//     update();
//     print(theme.value);
//   }
// }
