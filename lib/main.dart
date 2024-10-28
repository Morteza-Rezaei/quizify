import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/bloc_providers.dart';
import 'package:quizify/constants/theme/theme.dart';
import 'package:quizify/global.dart';
import 'package:quizify/screens/landing/landing_screen.dart';
import 'package:quizify/screens/sign_in/sign_in_screen.dart';
import 'package:quizify/utils/util.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // becuase of the hackathon deadline, for now we will use the light theme
    // final brightness = View.of(context).platformDispatcher.platformBrightness;

    // If need to use the default theme:
    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Here we use Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(
      context,
      "Roboto",
      "Roboto",
    );

    // To use our custom theme
    MaterialTheme theme = MaterialTheme(textTheme);

    // Decide the initial screen based on device and user state
    Widget initialScreen;
    bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
    bool isLoggedIn = Global.storageService.getIsLoggedIn();

    // Navigation logic
    if (!deviceFirstOpen) {
      // If the app is opened for the first time, go to the landing screen
      initialScreen = const LandingScreen();
    } else if (isLoggedIn) {
      // If the user is logged in, go to the app home screen
      // for now we will use the sign in screen
      initialScreen = const SignInScreen();
    } else {
      // If the user is not logged in, go to the sign-in screen
      initialScreen = const SignInScreen();
    }

    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: MaterialApp(
        title: 'Quizify',
        // to remove the debug banner
        debugShowCheckedModeBanner: false,

        // we dont use this for now but we can use this to change the theme based on the brightness
        // Here we use and apply the our custom theme
        //theme: brightness == Brightness.light ? theme.light() : theme.dark(),

        // for now we will use the light theme
        theme: theme.light(),
        home: initialScreen,
      ),
    );
  }
}
