import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class Dialogs extends StatelessWidget {
  const Dialogs({super.key});

  @override
  Widget build(BuildContext context) {
    void callback(BuildContext context, Widget dialog) {
      showDialog(context: context, builder: (context) => dialog);
    }

    final backgroundColor = context.knobs.color(label: 'BackGround Color', initialValue: Colors.white);
    final title = context.knobs.string(label: 'Title', initialValue: 'This is Dialog');
    final content = context.knobs.string(label: 'Content', initialValue: 'This is content');
    final action1 = context.knobs.string(label: 'Action1 Text', initialValue: 'No');
    final action2 = context.knobs.string(label: 'Action1 Text', initialValue: 'Yes');

    return Scaffold(
      appBar: AppBar(title: Text('Dialogs')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () => callback(
                      context,
                      _DefaultDialog(backgroundColor: backgroundColor, text: title),
                    ),
                child: Text('Default Dialog')),
            SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => callback(
                context,
                _AlertDialog(
                  backgroundColor: backgroundColor,
                  title: title,
                  content: content,
                  action1: action1,
                  action2: action2,
                ),
              ),
              child: Text(
                'Alert Dialog',
              ),
            ),
            SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => callback(
                context,
                _CupertinoDialog(
                  title: title,
                  content: content,
                  action1: action1,
                  action2: action2,
                ),
              ),
              child: Text('Cupertino Dialog'),
            )
          ],
        ),
      ),
    );
  }
}

class _DefaultDialog extends StatelessWidget {
  final Color backgroundColor;
  final String text;

  const _DefaultDialog({required this.backgroundColor, required this.text});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      child: Text(text),
    );
  }
}

class _AlertDialog extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String content;
  final String action1;
  final String action2;

  const _AlertDialog({
    required this.backgroundColor,
    required this.title,
    required this.content,
    required this.action1,
    required this.action2,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(onPressed: () {}, child: Text(action1)),
        TextButton(onPressed: () {}, child: Text(action2)),
      ],
    );
  }
}

class _CupertinoDialog extends StatelessWidget {
  final String title;
  final String content;
  final String action1;
  final String action2;

  const _CupertinoDialog({required this.title, required this.content, required this.action1, required this.action2});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
          child: Text(action1),
          isDefaultAction: true,
        ),
        CupertinoDialogAction(
          child: Text(action2),
          isDestructiveAction: true,
        ),
      ],
    );
  }
}
