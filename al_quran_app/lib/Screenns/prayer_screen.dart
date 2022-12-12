import 'package:flutter/material.dart';

class Prayer_Screen extends StatefulWidget {
  const Prayer_Screen({super.key});

  @override
  State<Prayer_Screen> createState() => _Prayer_ScreenState();
}

class _Prayer_ScreenState extends State<Prayer_Screen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Prayer Screen'),
        ),
      ),
    );
  }
}
