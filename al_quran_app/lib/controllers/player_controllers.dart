import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerControllers extends StatelessWidget {
  const PlayerControllers({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (() {
              audioPlayer.seekToPrevious();
            }),
            icon: const Icon(
              Icons.skip_previous_rounded,
              color: Colors.white,
              size: 60,
            ),
          ),
          StreamBuilder<PlayerState>(
              stream: audioPlayer.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                final processingState = playerState?.processingState;
                final playeing = playerState?.playing;
                if (!(playeing ?? false)) {
                  return IconButton(
                      color: Colors.white,
                      iconSize: 80,
                      onPressed: (() {
                        audioPlayer.play();
                      }),
                      icon: const Icon(Icons.play_arrow_rounded));
                } else if (processingState != ProcessingState.completed) {
                  return IconButton(
                      color: Colors.white,
                      iconSize: 80,
                      onPressed: (() {
                        audioPlayer.pause();
                      }),
                      icon: const Icon(Icons.pause_circle_filled));
                }
                return const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 80,
                );
              }),
          IconButton(
            onPressed: (() {
              audioPlayer.seekToNext();
            }),
            icon: const Icon(
              Icons.skip_next_rounded,
              color: Colors.white,
              size: 60,
            ),
          ),
        ],
      ),
    );
  }
}
