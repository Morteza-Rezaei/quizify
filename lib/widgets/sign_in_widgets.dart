import 'package:flutter/material.dart';
import 'package:quizify/constants/padding/paddings.dart';
import 'package:quizify/constants/values/colors/app_colors.dart';
import 'package:quizify/constants/values/strings/sign_in_text.dart';
import 'package:quizify/screens/forgot_password/forgot_pasword.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ForgotPaswordScreen(),
              ),
            );
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
