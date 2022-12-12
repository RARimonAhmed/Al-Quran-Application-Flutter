import 'package:flutter/material.dart';

class Quran_Screen extends StatefulWidget {
  const Quran_Screen({super.key});

  @override
  State<Quran_Screen> createState() => _Quran_ScreenState();
}

class _Quran_ScreenState extends State<Quran_Screen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Quran Screen'),
        ),
      ),
    );
  }
}
