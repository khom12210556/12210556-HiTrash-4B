import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hitrash/view/daftar.dart';
import 'package:hitrash/widget/buttonGlobal.dart';
import 'package:hitrash/widget/sociallogin.dart';
import 'package:hitrash/widget/textformglobal.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/logocolor.png',
                  width: 200,
                ),
                const SizedBox(
                  height: 60,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login With Your Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,

                  /// Email Input form
                ),
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                // Password Input
                const SizedBox(
                  height: 15,
                ),
                TextFormGlobal(
                    controller: passwordController,
                    text: 'Password',
                    textInputType: TextInputType.text,
                    obscure: true),
                const SizedBox(
                  height: 15,
                ),
                const ButtonGlobal(),
                const SizedBox(
                  height: 50,
                ),
                socialLogin()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DaftarView()),
                );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Color.fromRGBO(0, 121, 191, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
