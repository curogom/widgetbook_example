import 'package:flutter/material.dart';
import 'package:widgetbook_example/button.dart';
import 'package:widgetbook_example/dialogs.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        TextScaleAddon(
          scales: [1.0, 2.0],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone12,
            Devices.ios.iPhone13,
          ],
        ),
      ],
      directories: [
        WidgetbookComponent(
          name: 'Buttons',
          useCases: [
            WidgetbookUseCase(name: 'Default', builder: (context) => const Buttons()),
          ]
        ),
        WidgetbookComponent(
            name: 'Dialogs',
            useCases: [
              WidgetbookUseCase(name: 'Default', builder: (context) => const Dialogs()),
            ]
        ),
      ],
    );
  }
}
