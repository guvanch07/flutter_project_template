// ignore_for_file: uri_does_not_exist, undefined_class, undefined_identifier, not_a_type, undefined_method, undefined_annotation_member, invalid_annotation_target, uri_has_not_been_generated, unused_element

import 'package:flutter/material.dart';
import 'package:{{project_name}}/app.dart';
import 'package:{{project_name}}/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}
