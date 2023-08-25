import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonText = context.knobs.string(label: 'Button Text', initialValue: 'Tab!');

    void onPressed() => print(buttonText);

    return Scaffold(
      appBar: AppBar(title: Text('Buttons')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: onPressed, child: Text(buttonText)),
            SizedBox(height: 12),
            ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
            SizedBox(height: 12),
            OutlinedButton(onPressed: onPressed, child: Text(buttonText))
          ],
        ),
      ),
    );
  }
}
