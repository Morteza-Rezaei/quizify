import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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

// placeholder image
// it change the asset image to a file
Future<File> getImageFileFromAssets({required String imageAssetPath}) async {
  final byteData = await rootBundle.load(imageAssetPath);
  final file = File('${(await getTemporaryDirectory()).path}/placeholder.jpeg');
  await file.writeAsBytes(byteData.buffer.asUint8List());
  return file;
}

// the snackbar widget
void showSnackBar({
  required BuildContext context,
  required String text,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
      ),
    ),
  );
}
