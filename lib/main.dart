import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hitrash/providers/mapprovider.dart';
import 'package:hitrash/splash.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MapProvider()),
        // add more providers if needed
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    ),
  );
}
