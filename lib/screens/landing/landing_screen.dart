import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/landing_blocs/landing_blocs.dart';
import 'package:quizify/blocs/landing_blocs/landing_evets.dart';
import 'package:quizify/blocs/landing_blocs/landing_states.dart';
import 'package:quizify/constants/values/paths/landing_paths.dart';
import 'package:quizify/constants/values/strings/landing_text.dart';
import 'package:quizify/widgets/landing_widgets.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    // PageController to manage page navigation within PageView
    PageController pageController = PageController();
    return Scaffold(
      body: BlocBuilder<LandingBlocs, LandingStates>(
        builder: (context, state) {
          return Container(
            // Sets a background image for the entire screen
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_image.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // PageView to navigate between pages
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    // Updates the page index in the state
                    state.pageIndex = index;
                    // Triggers an event to notify the Bloc of the page change
                    BlocProvider.of<LandingBlocs>(context).add(LandingEvents());
                  },
                  children: [
                    // Page 1
                    landingScreenBody(
                      context: context,
                      pageController: pageController,
                      nextPageIndex: state.pageIndex + 1,
                      imageHeight: 250,
                      imagePath: LandingPaths.landing1,
                      title: LandingText.pageOneTitle,
                      description: LandingText.pageOneDescription,
                      buttonText: LandingText.pageOneButton,
                    ),
                    // Page 2
                    landingScreenBody(
                      context: context,
                      pageController: pageController,
                      nextPageIndex: state.pageIndex + 1,
                      imageHeight: 250,
                      imagePath: LandingPaths.landing2,
                      title: LandingText.pageTwoTitle,
                      description: LandingText.pageTwoDescription,
                      buttonText: LandingText.pageTwoButton,
                    ),
                    // Page 3
                    landingScreenBody(
                      context: context,
                      pageController: pageController,
                      nextPageIndex: state.pageIndex + 1,
                      imageHeight: 250,
                      imagePath: LandingPaths.landing3,
                      title: LandingText.pageThreeTitle,
                      description: LandingText.pageThreeDescription,
                      buttonText: LandingText.pageThreeButton,
                    ),
                  ],
                ),
                // Dots Indicator
                dotsIndicator(
                  currentIndex: state.pageIndex,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
