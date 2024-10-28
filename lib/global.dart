import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizify/data/service/storage_service.dart';

class Global {
  static late StorageService storageService;
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    storageService = await StorageService().init();
  }
}
