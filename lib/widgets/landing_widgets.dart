import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:quizify/constants/padding/paddings.dart';
import 'package:quizify/constants/values/colors/app_colors.dart';
import 'package:quizify/data/service/storage_constants.dart';
import 'package:quizify/global.dart';
import 'package:quizify/screens/sign_in/sign_in_screen.dart';

Widget landingScreenBody({
  required BuildContext context,
  required PageController pageController,
  required int nextPageIndex,
  required double imageHeight,
  required String imagePath,
  required String title,
  required String description,
  required String buttonText,
}) {
  return SafeArea(
    child: Container(
      margin: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image
          Container(
            height: imageHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
              ),
            ),
          ),

          // Title and Description
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: kVericalPadding * 3,
              horizontal: kHorizontalPadding * 0.6,
            ),
            child: Column(
              children: [
                Text(
                  title,
                  // use the headlineSmall style from the theme
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: kInBetweenSpacing * 3),
                Text(
                  description,
                  // use the bodyMedium style from the theme
                  // also we just use white color for the text
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.neutral50,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Button
          Container(
            margin: const EdgeInsets.only(
              top: kVericalPadding,
            ),
            child: ElevatedButton(
              onPressed: () {
                // navigate to the next page
                if (nextPageIndex < 3) {
                  pageController.animateToPage(
                    nextPageIndex,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                } else if (nextPageIndex == 3) {
                  // set the device first open to true
                  // so the user will not see this screen again
                  Global.storageService.setBool(
                    StorageConstants.deviceFirstOpen,
                    true,
                  );
                  // navigate to the sign in screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                    (route) => false,
                  );
                }
              },
              child: Text(
                buttonText,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget dotsIndicator({
  required int currentIndex,
}) {
  return Positioned(
    bottom: kVericalPadding * 3,
    child: DotsIndicator(
      // so the dots will be updated based on the state value
      position: currentIndex,
      dotsCount: 3,
      mainAxisAlignment: MainAxisAlignment.center,
      decorator: DotsDecorator(
        spacing: const EdgeInsets.symmetric(horizontal: 5),
        size: const Size(12, 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        activeSize: const Size(24, 12),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppColors.primary80,
        activeColor: AppColors.primary50,
      ),
    ),
  );
}
