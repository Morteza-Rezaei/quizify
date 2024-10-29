import 'package:flutter/material.dart';
import 'package:quizify/constants/padding/paddings.dart';
import 'package:quizify/constants/values/colors/app_colors.dart';
import 'package:quizify/constants/values/paths/auth_paths.dart';
import 'package:quizify/constants/values/strings/sign_in_text.dart';

// sign in screen title image
Widget signInScreenTitleImage() {
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: kVericalPadding * 2,
    ),
    height: kDefaultPadding * 4,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(AuthPaths.signIn),
      ),
    ),
  );
}

// sign in screen title
Widget signInScreenTitle(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: kVericalPadding * 1.2),
    child: Text(
      SignInText.title,
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}

// forgot password textbutton
Widget forgotPasswordTextButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      top: kVericalPadding / 2,
      bottom: kVericalPadding,
      right: kHorizontalPadding * 1.2,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            //Todo: navigate to forgot password screen
          },
          child: Text(
            SignInText.forgotPassword,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.primary,
                ),
          ),
        ),
      ],
    ),
  );
}
