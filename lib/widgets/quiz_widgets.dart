import 'package:flutter/material.dart';
import 'package:quizify/constants/padding_and_border/border_radius.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/colors/app_colors.dart';
import 'package:quizify/widgets/shadow_widgets.dart';

// the header of the quiz pages
Widget quizHeader({
  required BuildContext context,
  required String title,
  required String description,
  required String imagePath,
}) {
  return Container(
    padding: const EdgeInsets.only(
      top: kVericalPadding / 2,
      left: kHorizontalPadding,
      right: kHorizontalPadding,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.neutral70,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: kHorizontalPadding,
              ),
              child: Image.asset(
                imagePath,
                width: 85,
                height: 85,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// the list of topics
Widget quizTopicsList({
  required List<String> topics,
  required ValueChanged<bool?> onChanged,
}) {
  return // the list of topics
      ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.symmetric(
      vertical: kVericalPadding,
    ),
    itemCount: topics.length,
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
              vertical: kInBetweenSpacing,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(kCardBorderRadius),
              boxShadow: AppShadows.smallCardShadows,
            ),
            child: CheckboxListTile(
              title: Text(topics[index]),
              value: false,
              activeColor: AppColors.neutral50,
              side: const BorderSide(
                color: AppColors.neutral70,
                width: 1.5,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      );
    },
  );
}
