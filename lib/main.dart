import 'package:assessment/screens/register_screen.dart';
import 'package:assessment/services/auth_service.dart';
import 'package:assessment/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'localization/localization.dart';
import 'validation/validation.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<Validation>(
          create: (_) => Validation(),
        )
      ],
      child: GetMaterialApp(
        translations: LocaleString(),
        locale: const Locale('en', 'US'),
        title: 'Assessment App',
        home: const Wrapper(),
        routes: {
          RegisterScreen.routeName: (_) => RegisterScreen(),
        },
      ),
    );
  }
}
