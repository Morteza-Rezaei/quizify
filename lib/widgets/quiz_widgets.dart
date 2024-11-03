import 'package:flutter/material.dart';
import 'package:quizify/constants/padding_and_border/border_radius.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/colors/app_colors.dart';
import 'package:quizify/constants/values/strings/quiz_text.dart';
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

// the Quiz Question widget
Widget quizQuestion({
  required BuildContext context,
  required int questionIndex,
  required String question,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(
      right: kHorizontalPadding,
      left: kHorizontalPadding,
      top: kVericalPadding * 2,
      bottom: kVericalPadding / 2,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Soru $questionIndex',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.primary,
              ),
        ),
        Text(
          question,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    ),
  );
}

// the answer card widget
Widget answerCard({
  required BuildContext context,
  required bool isSelected,
  required void Function() onTap,
  required String leadingLetter,
  required String answer,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: kVericalPadding / 2,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: kVericalPadding,
        horizontal: kHorizontalPadding,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary90 : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(kCardBorderRadius),
        boxShadow: AppShadows.smallCardShadows,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            leadingLetter,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.primary50,
                ),
          ),
          const SizedBox(
            width: kInBetweenSpacing,
          ),
          Flexible(
            child: Text(
              answer,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    ),
  );
}

// the quiz result Big Header widget
Widget quizBigHeader({
  required BuildContext context,
  required String title,
}) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(
        top: kVericalPadding * 3,
        bottom: kVericalPadding * 2,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: AppColors.primary,
            ),
      ),
    ),
  );
}

// the title and the description widget
Widget titleAndDescription({
  required BuildContext context,
  required String title,
  required String description,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: kHorizontalPadding,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          QuizText.resultTitle,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.primary,
              ),
        ),
        Text(
          QuizText.resultDescription,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.neutral70,
              ),
        ),
      ],
    ),
  );
}

// the result card widget
Widget resultCard({
  required BuildContext context,
  required int questionNo,
  required String question,
  required bool isCorrect,
  required String leadingLetter,
  required String answer,
}) {
  return Container(
    width: MediaQuery.of(context).size.width - kHorizontalPadding * 3,
    margin: const EdgeInsets.symmetric(
      horizontal: kInBetweenSpacing,
      vertical: kVericalPadding,
    ),
    padding: const EdgeInsets.symmetric(
      vertical: kVericalPadding,
      horizontal: kHorizontalPadding,
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(kCardBorderRadius),
      boxShadow: AppShadows.smallCardShadows,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Qustion number and the question
        Text(
          'Soru $questionNo:',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.primary,
              ),
        ),
        const SizedBox(
          height: kInBetweenSpacing / 2,
        ),
        Text(
          question,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            top: kVericalPadding,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: kVericalPadding,
            horizontal: kHorizontalPadding,
          ),
          decoration: BoxDecoration(
            color: isCorrect ? AppColors.greenLow : AppColors.redLow,
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            boxShadow: AppShadows.smallCardShadows,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leadingLetter,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                width: kInBetweenSpacing,
              ),
              Flexible(
                child: Text(
                  answer,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// warning alert dialog  for the quiz
Future<void> quizWarningAlertDialog({
  required BuildContext context,
  required String imagePath,
  required String title,
  required String content,
  required String filledBtnName,
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
