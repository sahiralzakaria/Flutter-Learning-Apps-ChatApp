import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:simplechatapp/constants.dart';
import 'package:simplechatapp/pages/register_page.dart';
import 'package:simplechatapp/widgets/custom_buton.dart';
import 'package:simplechatapp/widgets/custom_text_field.dart';
import 'package:simplechatapp/widgets/show_snack_bar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
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
                CustomButon(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;

                      setState(() {});
                      try {
                        await registerUser();

                        showSnackBar(context, 'Successful');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context, 'weak-password');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context, 'email-already-in-use');
                        }
                      } catch (ex) {
                        showSnackBar(context, "There was an error");
                      }

                      setState(() {
                        isLoading = false;
                      });
                    } else {}
                  },

                  color: Colors.white,
                  text: 'LOGIN',
                ),
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
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
