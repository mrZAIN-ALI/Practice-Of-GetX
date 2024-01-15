import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../controllerType/CounterController.dart';
class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Displaying the current count using GetX
            GetX<CounterController>(
              init: CounterController(),
              builder: (controller) => Text(
                'Count: ${controller.count}',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            // Buttons to increment and decrement the count
            ElevatedButton(
                onPressed: () => CounterController.to.increment(),
              child: Text('Increment'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => CounterController.to.decrement(),
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}

