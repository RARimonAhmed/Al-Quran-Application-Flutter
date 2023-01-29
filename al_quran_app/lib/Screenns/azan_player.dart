import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AzanPlayer extends StatelessWidget {
  const AzanPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final audios = AudioPlayer()..setAsset('images/ajan.mp3');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              child: IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                ),
                iconSize: 50,
                onPressed: (() {
                  audios.play();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
