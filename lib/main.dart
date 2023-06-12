
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
        // tambahkan provider lain jika diperlukan
      ],
      child: Builder(
        builder: (context) {
          context.read<MapProvider>().mulai_bacalokasi();
          return MaterialApp(
            home: SplashScreen(),
          );
        },
      ),
    ),
  );
}