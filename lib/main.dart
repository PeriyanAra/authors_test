import 'package:authors/app/authors_app.dart';
import 'package:authors/app/register_app_dependencies.dart';
import 'package:authors/authors_app_shared/lib/src/di.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final di = GetItDI();

  await registerAppDependencies(di: di);

  runApp(AuthorsApp(di: di));
}
