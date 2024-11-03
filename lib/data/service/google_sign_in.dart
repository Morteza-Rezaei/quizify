import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

Future<UserCredential?> googleSignIn(BuildContext context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  // Check if the user canceled the sign-in process
  if (googleUser == null) {
    // Return null or handle the cancellation as needed
    return null;
  }

  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final userCredential = await auth.signInWithCredential(credential);
  final user = userCredential.user;

  if (user != null) {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (!userDoc.exists) {
      // User does not exist, save user info and Gmail image as avatar
      final avatarUrl = user.photoURL;
      final userName = user.displayName;
      final email = user.email;

      // Download the avatar image
      final response = await http.get(Uri.parse(avatarUrl!));
      final directory = await Directory.systemTemp.createTemp();
      final avatarFile = File('${directory.path}/avatar.jpg');
      await avatarFile.writeAsBytes(response.bodyBytes);

      // Upload the avatar image to Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child(user.uid)
          .child('profile')
          .child('${user.uid}.jpg');

      await storageRef.putFile(avatarFile);
      final uploadedAvatarUrl = await storageRef.getDownloadURL();

      // Save user info to Firestore
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'userName': userName,
        'email': email,
        'imageUrl': uploadedAvatarUrl,
      });
    }
  }

  return userCredential;
}
