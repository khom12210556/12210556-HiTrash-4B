import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hitrash/view/dashboardCostumer.dart';
import 'package:hitrash/view/dashboardPenjemput.dart';
import 'package:hitrash/view/login.dart';
import 'package:hitrash/view/permintaanpenjemputan.dart';
import 'package:hitrash/view/pesanPenjemputanview.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    SplashScreenStart();
  }

  SplashScreenStart() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardCosView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0079BF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 250,
              width: 250,
            )
          ],
        ),
      ),
    );
  }
}
