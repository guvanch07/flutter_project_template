import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:{{project_name}}/app.dart';
import 'package:{{project_name}}/firebase_options.dart';
import 'package:{{project_name}}/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  runApp(const App());
}
