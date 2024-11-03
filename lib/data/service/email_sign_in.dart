// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/sign_in_blocs/sign_in_blocs.dart';
import 'package:quizify/blocs/sign_in_blocs/sign_in_events.dart';
import 'package:quizify/constants/values/strings/sign_in_text.dart';
import 'package:quizify/data/service/storage_constants.dart';
import 'package:quizify/global.dart';
import 'package:quizify/screens/home/home_screen.dart';
import 'package:quizify/widgets/app_widgets.dart';

Future<void> emailSignIn({
  required BuildContext context,
}) async {
  final signInBloc = context.read<SignInBloc>();
  final state = signInBloc.state;

  String email = state.email;
  String password = state.password;

  try {
    // enable loading
    signInBloc.add(SignInLoadingEvent(true));

    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user == null) {
      // disable loading
      signInBloc.add(SignInLoadingEvent(false));
      // show snackbar
      showSnackBar(
        context: context,
        text: SignInText.emailNotExist,
      );
      return;
    }
    if (userCredential.user!.emailVerified == false) {
      // disable loading
      signInBloc.add(SignInLoadingEvent(false));
      // show snackbar
      showSnackBar(
        context: context,
        text: SignInText.emailNotVerified,
      );
      return;
    }

    // so here we assume that user is exist and verified
    var user = userCredential.user;
    if (user != null) {
      // setting the storage user key to the user's uid
      Global.storageService.setString(StorageConstants.userToken, user.uid);

      // show snackbar
      showSnackBar(
        context: context,
        text: SignInText.signInSuccess,
      );

      // disable loading
      signInBloc.add(SignInLoadingEvent(false));
      // the reset event of the bloc
      signInBloc.add(ResetSignInEvent());

      // navigate to the home screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    } else {
      // disable loading
      signInBloc.add(SignInLoadingEvent(false));
      // show snackbar
      showSnackBar(
        context: context,
        text: SignInText.userNotExist,
      );
      return;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      // show snackbar
      showSnackBar(
        context: context,
        text: SignInText.emailNotExist,
      );
    } else if (e.code == 'wrong-password') {
      // show snackbar
      showSnackBar(
        context: context,
        text: SignInText.wrongPassword,
      );
    } else if (e.code == 'invalid-email') {
      // show snackbar
      showSnackBar(
        context: context,
        text: SignInText.invalidEmail,
      );
    } else if (e.code == 'invalid-credential') {
      // show snackbar
      showSnackBar(
        context: context,
        text: SignInText.invalidCredential,
      );
    } else {
      // show snackbar
      showSnackBar(
        context: context,
        text: "${SignInText.signInError}\n${e.code}",
      );
    }

    // disable loading
    signInBloc.add(SignInLoadingEvent(false));
  }
}
