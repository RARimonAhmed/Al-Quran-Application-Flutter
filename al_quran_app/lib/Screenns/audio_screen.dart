import 'package:al_quran_app/models/qari.dart';
import 'package:al_quran_app/models/surah_model.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Audio_Screen extends StatefulWidget {
  const Audio_Screen({super.key, required this.index, required this.list});

  final int index;
  final List<Surah>? list;
  @override
  State<Audio_Screen> createState() => _Audio_ScreenState();
}

class _Audio_ScreenState extends State<Audio_Screen> {
  final player = AudioPlayer();
  bool isLoppingCurrentItem = false;
  Duration defaultDuration = Duration(milliseconds: 1);
  String? ind;
  int currentIndex = 0;
  int dataIndex = 0;
  @override
  void initState() {
    setState(() {
      currentIndex = widget.index - 1;
      dataIndex = widget.index - 1;
    });
    if (widget.index < 10) {
      ind = "00" + (widget.index.toString());
    } else if (widget.index < 100) {
      ind = "00" + (widget.index.toString());
    } else if (widget.index > 100) {
      ind = (widget.index.toString());
    }
    // _initAudioPlayer(ind!, widget.qari);
    print("Index ${widget.index} current index ${currentIndex}");
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    player.dispose();
    super.dispose();
  }

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
