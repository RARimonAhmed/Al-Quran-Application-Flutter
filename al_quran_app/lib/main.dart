import 'package:al_quran_app/Constants/constants.dart';
import 'package:al_quran_app/Screenns/jazscreen.dart';
import 'package:al_quran_app/Screenns/surahdetailscreen.dart';
import 'package:flutter/material.dart';

import 'Screenns/spalshscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al-Quran',
      theme: ThemeData(
        primarySwatch: Constants.kSwatch,
        primaryColor: Constants.kPrimary,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: const SpalshScreen(),
      routes: {
        JazScreen.jazId: (context) => JazScreen(),
        SurahDetails.surahId: (context) => const SurahDetails(),
      },
    );
  }
}
