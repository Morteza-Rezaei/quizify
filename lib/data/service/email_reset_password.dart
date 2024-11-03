// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/forgot_password_blocs/forgot_password_blocs.dart';
import 'package:quizify/blocs/forgot_password_blocs/forgot_password_events.dart';
import 'package:quizify/constants/values/strings/forgot_password_text.dart';
import 'package:quizify/widgets/app_widgets.dart';

Future<void> emailResetPassword({
  required BuildContext context,
}) async {
  final signInBloc = context.read<ForgotPasswordBlocs>();
  final state = signInBloc.state;

  String email = state.email;

  try {
    // enable loading
    signInBloc.add(ForgotPasswordLoadingEvent(true));

    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    // show snackbar
    showSnackBar(
      context: context,
      text: '${ForgotPasswordText.resetLinkSentTitle}:\n$email',
    );

    // disable loading
    signInBloc.add(ForgotPasswordLoadingEvent(false));
    // reset the bloc
    signInBloc.add(ResetForgotPasswordEvent());

    // pop the screen
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      // show snackbar
      showSnackBar(
        context: context,
        text: ForgotPasswordText.emailNotExist,
      );
    } else {
      // show snackbar
      showSnackBar(
        context: context,
        text: "${ForgotPasswordText.errorOccurred}: ${e.message}",
      );
    }
    // disable loading
    signInBloc.add(ForgotPasswordLoadingEvent(false));
  }
}
