import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/colors/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // //app logo
          // const Image(
          //   image: AssetImage(
          //     LoadingPaths.loading,
          //   ),
          //   width: 180,
          // ),
          const SizedBox(height: kVericalPadding),
          const SpinKitSpinningLines(
            color: AppColors.primary80,
            size: kDefaultPadding * 12,
          ),
          const SizedBox(height: kVericalPadding * 2),
          Text(
            'Lütfen Bekleyin...',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.primary80,
                ),
          ),
        ],
      ),
    );
  }
}
