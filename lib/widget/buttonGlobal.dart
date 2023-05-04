// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hitrash/view/dashboard.dart';

class ButtonGlobal extends StatelessWidget {
  const ButtonGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Login');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardView()),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 121, 191, 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            )
          ],
        ),
        child: const Text(
          'Sign In',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
