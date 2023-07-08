import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/config/router/routes_enum.dart';

Future<T?> customDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
}) async {
  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => AppNavigator.pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  } else {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      },
    );
  }
}
