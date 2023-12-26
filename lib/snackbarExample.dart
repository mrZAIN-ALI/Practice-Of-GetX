// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Get.snackbar(
//               "Hello", // title
//               "This is a message", // message
//               icon: Icon(Icons.notification_important),
//               shouldIconPulse: true,
//               onTap: (val) {},
//               barBlur: 20,
//               isDismissible: true,
//               duration: Duration(seconds: 3),
//             );
//           },
//           child: Text('Show Snackbar'),
//         ),
//       ),
//     );
//   }
// }