import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/core/utils/routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: AppRouter.routes,
        theme: theme,
        debugShowCheckedModeBanner: false,
        title: 'Hogwarts College App',
        initialRoute: AppRouter.authView);
  }
}
