import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hopewell/common/service/storage_service.dart';
import 'package:hopewell/firebase_options.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    storageService = await StorageService().init();
  }
}
