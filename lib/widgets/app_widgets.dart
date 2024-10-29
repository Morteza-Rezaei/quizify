import 'package:flutter/material.dart';

// app rounded back button widget
Widget backButton(
  context,
) {
  return IconButton(
    icon: const Icon(Icons.arrow_back_rounded),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
