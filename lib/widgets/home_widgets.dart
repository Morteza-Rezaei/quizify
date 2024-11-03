import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizify/constants/padding_and_border/border_radius.dart';
import 'package:quizify/constants/padding_and_border/paddings.dart';
import 'package:quizify/constants/values/colors/app_colors.dart';
import 'package:quizify/constants/values/paths/home_paths.dart';
import 'package:quizify/constants/values/strings/home_text.dart';
import 'package:quizify/data/models/subject_model.dart';
import 'package:quizify/data/service/storage_constants.dart';
import 'package:quizify/global.dart';
import 'package:quizify/screens/quiz/quiz_screen_topics.dart';
import 'package:quizify/screens/sign_in/sign_in_screen.dart';
import 'package:quizify/widgets/app_widgets.dart';
import 'package:quizify/widgets/shadow_widgets.dart';

// sign out Function
Future<void> _signOut() async {
  // sign out the user
  final FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut();

  // remove the user token from the storage
  Global.storageService.remove(StorageConstants.userToken);
}

// the header Widgets for the home screen
Widget homeScreenHeader({
  required BuildContext context,
}) {
  final user = FirebaseAuth.instance.currentUser;
  return FutureBuilder(
    future: FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kVericalPadding * 1.5,
          ),
          child: loadingMini(),
        );
      } else if (snapshot.hasError) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kVericalPadding * 1.5,
          ),
          child: Text(
            HomeText.errorMessage,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.primary50,
                ),
          ),
        );
      } else {
        final userData = snapshot.data;
        final imageUrl = userData?['imageUrl'] ?? HomePaths.avatar;
        final userName = userData?['userName'] ?? 'User';
        return Container(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            top: kDefaultPadding,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Merhaba, $userName 👋',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.primary,
                                ),
                      ),
                      Text(
                        HomeText.description,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.neutral70,
                            ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // for now just sign out the user
                      warningAlertDialog(
                        context: context,
                        imagePath: HomePaths.signOut,
                        title: HomeText.signOutTitle,
                        content: HomeText.signOutContent,
                        outLinedBtnName: HomeText.signOutOutlinedBtn,
                        filledBtnName: HomeText.signOutFilledBtn,
                        onOutlinedBtnPressed: () {},
                        onFilledBtnPressed: () {
                          _signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      radius: kDefaultPadding * 2,
                      backgroundImage: NetworkImage(imageUrl!),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: kVericalPadding,
                  bottom: kVericalPadding / 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      HomeText.subjectTitle,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColors.neutral40,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}

// the subject card for the home screen
Widget subjectCard({
  required BuildContext context,
  required Subject subject,
}) {
  return GestureDetector(
    onTap: () {
      // Navigate to the quiz screen : first page selecting topics
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizScreenTopicsScreen(subject: subject),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: kInBetweenSpacing,
        horizontal: kHorizontalPadding,
      ),
      padding: const EdgeInsets.all(kDefaultPadding),
      // shadow and decoration
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kCardBorderRadius),
        boxShadow: AppShadows.bigCardShadows,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              right: kDefaultPadding,
            ),
            // image
            height: 85,
            width: 85,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  subject.imagePath,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          // card title
          Text(
            subject.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    ),
  );
}
