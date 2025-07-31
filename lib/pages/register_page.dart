import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simplechatapp/constants.dart';
import 'package:simplechatapp/widgets/custom_buton.dart';
import 'package:simplechatapp/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  static String id = 'RegisterPage';

  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Spacer(flex: 2),
            Image.asset('assets/images/logo.png', width: 150),
            Text(
              'Chat App',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontFamily: 'Playwrite',
              ),
            ),
            Spacer(flex: 2),
            Row(
              children: [
                Text(
                  'REGISTER',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomTextField(
              onChanged: (data) {
                email = data;
              },
              hint: 'Enter Your Name',
            ),
            SizedBox(height: 10),
            CustomTextField(
              onChanged: (data) {
                password = data;
              },
              hint: 'Enter Your Password',
            ),
            SizedBox(height: 20),
            CustomButon(
              color: Colors.white,
              onTap: () async {
                var auth = FirebaseAuth.instance;
                UserCredential user = await auth.createUserWithEmailAndPassword(
                  email: email!,
                  password: password!,
                );
              },
              text: 'REGISTER',
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account ? ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, RegisterPage.id);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Color(0xffade8f4)),
                  ),
                ),
              ],
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
