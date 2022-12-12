import 'package:flutter/material.dart';

class Audio_Screen extends StatefulWidget {
  const Audio_Screen({super.key});

  @override
  State<Audio_Screen> createState() => _Audio_ScreenState();
}

class _Audio_ScreenState extends State<Audio_Screen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Audio Screen'),
        ),
      ),
    );
  }
}
