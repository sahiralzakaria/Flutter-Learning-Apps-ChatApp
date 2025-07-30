import 'package:flutter/material.dart';
import 'package:simplechatapp/constants.dart';
import 'package:simplechatapp/pages/register_page.dart';
import 'package:simplechatapp/widgets/custom_buton.dart';
import 'package:simplechatapp/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String id = 'LoginPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(height: 90),

            Image.asset('assets/images/logo.png', height: 120),
            Center(
              child: Text(
                'Chat App  ',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontFamily: 'Playwrite',
                ),
              ),
            ),

            SizedBox(height: 90),
            Row(
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomTextField(hint: 'Enter Your Name'),
            SizedBox(height: 10),
            CustomTextField(hint: 'Enter Your Password'),
            SizedBox(height: 20),
            CustomButon(color: Colors.white, text: 'LOGIN'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "don\'t have an account ? ",
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterPage.id);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Color(0xffade8f4)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
