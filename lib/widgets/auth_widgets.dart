import 'package:flutter/material.dart';
import 'package:quizify/constants/padding/paddings.dart';
import 'package:quizify/constants/values/colors/app_colors.dart';

// auth screen title image
Widget authScreenTitleImage({
  required String imagePath,
  required double height,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: kVericalPadding * 2,
    ),
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
      ),
    ),
  );
}

// auth screen title
Widget authInScreenTitle({
  required BuildContext context,
  required String title,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: kVericalPadding * 1.2),
    child: Text(
      title,
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}

// auth screen Description Text
Widget authScreenDescriptionText({
  required BuildContext context,
  required String text,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      bottom: kInBetweenSpacing,
    ),
    child: Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.neutral70,
          ),
    ),
  );
}

// app textFormField widget
Widget authScreenTextFormField({
  required String fieldType,
  required String hintText,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  required void Function(String value) onSaved,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: kInBetweenSpacing),
    child: TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        } else if (fieldType == 'email') {
          if (!value.contains('@')) {
            return 'Please enter a valid email';
          }
          if (!value.contains('.')) {
            return 'Please enter a valid email';
          }
        } else if (fieldType == 'password') {
          if (value.length < 6) {
            return 'Password must be at least 6 characters long';
          }
          // must contain at least one number and character
          if (!value.contains(RegExp(r'[0-9]'))) {
            return 'Password must contain at least one number';
          }
          if (!value.contains(RegExp(r'[a-zA-Z]'))) {
            return 'Password must contain at least one character';
          }
        }
        return null;
      },
      onSaved: (value) => onSaved(value!),
    ),
  );
}

// authentication screens divider text widget
Widget dividerTextDivider({
  required BuildContext context,
  required String text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: kVericalPadding * 3,
      horizontal: kHorizontalPadding,
    ),
    child: Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.neutral70,
            thickness: 0.5,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          text,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.neutral70,
              ),
        ),
        const SizedBox(width: 15),
        const Expanded(
          child: Divider(
            color: AppColors.neutral70,
            thickness: 0.5,
          ),
        ),
      ],
    ),
  );
}

// Google Sign In Button
Widget googleSignInButton({
  required BuildContext context,
  required String label,
  required String iconPath,
}) {
  return OutlinedButton.icon(
    onPressed: () {
      // TODO: Implement Google Sign In
    },
    icon: Image(
      image: AssetImage(iconPath),
      height: 24,
      width: 24,
    ),
    label: Padding(
      padding: const EdgeInsets.only(
        left: kInBetweenSpacing,
      ),
      child: Text(label),
    ),
  );
}

// atuh pages navigation text button
Widget authPagesNavigationTextButton({
  required BuildContext context,
  required String text1,
  required String text2,
  required void Function() onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kVericalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.neutral70,
                ),
          ),
          Text(
            text2,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.primary50,
                ),
          ),
        ],
      ),
    ),
  );
}
