import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app/screens/home.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staff Manager',
      debugShowCheckedModeBanner: false,
      home: const Home(),
      builder: EasyLoading.init(),
    );
  }
}
