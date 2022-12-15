import 'dart:async';

import 'package:al_quran_app/Screenns/main_screen.dart';
import 'package:al_quran_app/Screenns/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  bool alreadyUsed = false;
  getData() async {
    final sharedPreference = await SharedPreferences.getInstance();
    alreadyUsed = sharedPreference.getBool('alreadyUsed') ?? false;
  }

  @override
  void initState() {
    super.initState();
    getData();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) {
              return alreadyUsed ? const MainScreen() : const Onboarding();
            }))));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Center(
              child: Text(
                'Al-Quran',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'images/islamic.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
