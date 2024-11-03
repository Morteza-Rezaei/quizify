import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizify/constants/padding_and_border/border_radius.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/colors/app_colors.dart';

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

// mini loading
Widget loadingMini() {
  return const SpinKitThreeBounce(
    color: AppColors.primary50,
    size: 24,
  );
}

// warning alert dialog  for deleting or any other action
Future<void> warningAlertDialog({
  required BuildContext context,
  required String imagePath,
  required String title,
  required String content,
  required String outLinedBtnName,
  required String filledBtnName,
  required void Function() onOutlinedBtnPressed,
  required void Function() onFilledBtnPressed,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCardBorderRadius * 3),
        ),
        title: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: kVericalPadding * 2,
                bottom: kVericalPadding * 2,
              ),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.primary50,
                  ),
            ),
          ],
        ),
        content: Text(
          content,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.neutral50,
              ),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                  vertical: kInBetweenSpacing,
                ),
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onOutlinedBtnPressed();
                  },
                  child: Text(outLinedBtnName),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                  vertical: kInBetweenSpacing,
                ),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onFilledBtnPressed();
                  },
                  child: Text(filledBtnName),
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}
