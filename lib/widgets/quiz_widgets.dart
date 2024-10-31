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
    padding: const EdgeInsets.symmetric(
      horizontal: kHorizontalPadding,
      vertical: kVericalPadding,
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
  required List<String> selectedTopics,
  required void Function(bool?, String) onChanged,
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
      final topic = topics[index];
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
              title: Text(topic),
              value: selectedTopics.contains(topic),
              activeColor: AppColors.primary50,
              side: const BorderSide(
                color: AppColors.neutral70,
                width: 1.5,
              ),
              onChanged: (isChecked) => onChanged(isChecked, topic),
            ),
          ),
        ],
      );
    },
  );
}

// the Quiz Options title
Widget quizOptionsTitle({
  required BuildContext context,
  required String title,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: kHorizontalPadding,
      vertical: kVericalPadding / 2,
    ),
    child: Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColors.neutral40,
          ),
    ),
  );
}

// 3 card in row widget
Widget threeCardsInRow({
  required BuildContext context,
  required String imagePath,
  required double imageWidth,
  required double imageHeight,
  required String title,
  required bool isActive,
  required void Function() onTap,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          left: kInBetweenSpacing,
          right: kInBetweenSpacing,
          bottom: kVericalPadding / 2,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: kVericalPadding,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary90 : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(kCardBorderRadius),
          boxShadow: AppShadows.smallCardShadows,
        ),
        child: Column(
          children: [
            Image.asset(
              width: imageWidth,
              height: imageHeight,
              imagePath,
            ),
            const SizedBox(
              height: kInBetweenSpacing,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    ),
  );
}

// the row row of the 3 cards
Widget threeCardsRow({
  required BuildContext context,
  required double imageWidth,
  required double imageHeight,
  required int isActive,
  required String imagePath1,
  required String title1,
  required void Function() onTap1,
  required String imagePath2,
  required String title2,
  required void Function() onTap2,
  required String imagePath3,
  required String title3,
  required void Function() onTap3,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding / 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // the timer selection buttons
        threeCardsInRow(
          context: context,
          imagePath: imagePath1,
          title: title1,
          isActive: isActive == 0,
          onTap: onTap1,
          imageWidth: imageWidth,
          imageHeight: imageHeight,
        ),
        threeCardsInRow(
          context: context,
          imagePath: imagePath2,
          title: title2,
          isActive: isActive == 1,
          onTap: onTap2,
          imageWidth: imageWidth,
          imageHeight: imageHeight,
        ),
        threeCardsInRow(
          context: context,
          imagePath: imagePath3,
          title: title3,
          isActive: isActive == 2,
          onTap: onTap3,
          imageWidth: imageWidth,
          imageHeight: imageHeight,
        ),
      ],
    ),
  );
}

// the small card widget
Widget smallCard({
  required BuildContext context,
  required String title,
  required bool isActive,
  required void Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 60,
      height: 50,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary90 : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(kCardBorderRadius),
        boxShadow: AppShadows.smallCardShadows,
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    ),
  );
}

// the 4 cards in row widget aka the small cards with just the title
Widget fourCardsInRow({
  required BuildContext context,
  required int isActive,
  required String title1,
  required void Function() onTap1,
  required String title2,
  required void Function() onTap2,
  required String title3,
  required void Function() onTap3,
  required String title4,
  required void Function() onTap4,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // the timer selection buttons
        smallCard(
          context: context,
          title: title1,
          isActive: isActive == 0,
          onTap: onTap1,
        ),
        smallCard(
          context: context,
          title: title2,
          isActive: isActive == 1,
          onTap: onTap2,
        ),
        smallCard(
          context: context,
          title: title3,
          isActive: isActive == 2,
          onTap: onTap3,
        ),
        smallCard(
          context: context,
          title: title4,
          isActive: isActive == 3,
          onTap: onTap4,
        ),
      ],
    ),
  );
}
