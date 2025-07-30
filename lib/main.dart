import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simplechatapp/firebase_options.dart';
import 'package:simplechatapp/pages/login_page.dart';
import 'package:simplechatapp/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // التأكد من تهيئة الـ bindings
  await Firebase.initializeApp();  // تهيئة Firebase

  runApp(const SimpleChatApp());
}

class SimpleChatApp extends StatelessWidget {
  const SimpleChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
      },
      initialRoute: 'LoginPage',
    );
  }
}
