import 'package:al_quran_app/Constants/constants.dart';
import 'package:al_quran_app/Screenns/audio_screen.dart';
import 'package:al_quran_app/Screenns/home_screen.dart';
import 'package:al_quran_app/Screenns/prayer_screen.dart';
import 'package:al_quran_app/Screenns/qarilistscreen.dart';
import 'package:al_quran_app/Screenns/quran_screen.dart';
import 'package:al_quran_app/models/qari.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final String assetName1 = 'images/home.png';
  final String assetName2 = 'images/holyQuran.png';
  final String assetName3 = 'images/prayer.png';
  final String assetName4 = 'images/mosque.png';
  final String assetName5 = 'images/audio.png';

  int selectIndex = 0;
  // ignore: prefer_final_fields
  List<Widget> _widget = [
    const Home_Screen(),
    const Quran_Screen(),
    const QariListScreen(),
    const Prayer_Screen(),
    const Audio_Screen(
      index: 0,
      list: [],
      // qari: ,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widget[selectIndex],
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
              icon: Image.asset(assetName1, color: Colors.white),
              title: 'Home',
            ),
            TabItem(
              icon: Image.asset(assetName2, color: Colors.white),
              title: 'Quran',
            ),
            TabItem(
              icon: Image.asset(assetName5, color: Colors.white),
              title: 'Audio',
            ),
            TabItem(
              icon: Image.asset(assetName4, color: Colors.white),
              title: 'Prayer',
            ),

            // TabItem(icon: Image.asset(assetName4), title: 'Profile'),
          ],
          initialActiveIndex: 0,
          onTap: updateIndex,
          backgroundColor: Constants.kPrimary,
          activeColor: Constants.kPrimary,
        ),
      ),
    );
  }

  void updateIndex(index) {
    setState(() {
      selectIndex = index;
    });
  }
}
