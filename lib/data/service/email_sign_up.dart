// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizify/blocs/sign_up_blocs/sign_up_blocs.dart';
import 'package:quizify/blocs/sign_up_blocs/sign_up_events.dart';
import 'package:quizify/constants/values/strings/sign_up_text.dart';
import 'package:quizify/widgets/app_widgets.dart';

Future<void> emailSignUp({
  required BuildContext context,
}) async {
  final signUpBloc = context.read<SignUpBlocs>();
  final state = signUpBloc.state;

  File userAvatar = await getImageFileFromAssets(
    imageAssetPath: state.userAvatar,
  );
  String userName = state.userName;
  String email = state.email;
  String password = state.password;
  String confirmPassword = state.confirmPassword;

  if (password != confirmPassword) {
    // show a snackbar
    showSnackBar(
      context: context,
      text: SignUpText.passwordsDoNotMatch,
    );
    return;
  } else if (password == confirmPassword) {
    try {
      // enable loading
      signUpBloc.add(LoadingEvent(true));

      // create user
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // update user profile
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child(userCredential.user!.uid)
          .child('profile')
          .child('${userCredential.user!.uid}.jpg');

      await storageRef.putFile(userAvatar);
      final avatarUrl = await storageRef.getDownloadURL();

      // we create a data on Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'userName': userName,
        'email': email,
        'imageUrl': avatarUrl,
      });

      if (userCredential.user != null) {
        await userCredential.user!.sendEmailVerification();
        await userCredential.user!.updateDisplayName(userName);

        // show a snackbar
        showSnackBar(
          context: context,
          text: SignUpText.signUpSuccess,
        );

        // disable loading
        signUpBloc.add(LoadingEvent(false));
        // reset the bloc
        signUpBloc.add(ResetSignUpEvent());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showSnackBar(
          context: context,
          text: SignUpText.emailAlreadyInUse,
        );
      } else if (e.code == 'invalid-email') {
        showSnackBar(
          context: context,
          text: SignUpText.invalidEmail,
        );
      } else if (e.code == 'weak-password') {
        showSnackBar(
          context: context,
          text: SignUpText.weakPassword,
        );
      } else {
        showSnackBar(
          context: context,
          text: "${SignUpText.unknownError}: ${e.code}",
        );
      }
      signUpBloc.add(LoadingEvent(false));
    }
  }
}
