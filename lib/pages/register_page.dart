import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:simplechatapp/constants.dart';
import 'package:simplechatapp/pages/chat_page.dart';
import 'package:simplechatapp/widgets/custom_buton.dart';
import 'package:simplechatapp/widgets/custom_text_form_field.dart';
import 'package:simplechatapp/helper/show_snack_bar.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email;

  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 90),

                Image.asset(kLogo, height: 120),
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
                      'REGISTER',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  onChanged: (data) {
                    email = data;
                  },
                  hint: 'Enter Your Email',
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  onChanged: (data) {
                    password = data;
                  },
                  hint: 'Enter Your Password',
                ),
                SizedBox(height: 20),
                CustomButon(
                  color: Colors.white,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;

                      setState(() {});
                      try {
                        await registerUser();

                        Navigator.pushNamed(context, ChatPage.id);
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
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

  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
