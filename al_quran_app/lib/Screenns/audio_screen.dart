// import 'package:al_quran_app/models/qari.dart';
// import 'package:al_quran_app/models/surah_model.dart';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// class Audio_Screen extends StatefulWidget {
//   const Audio_Screen({super.key, required this.index, required this.list});

//   final int index;
//   final List<Surah>? list;
//   @override
//   State<Audio_Screen> createState() => _Audio_ScreenState();
// }

// class _Audio_ScreenState extends State<Audio_Screen> {
//   final player = AudioPlayer();
//   bool isLoppingCurrentItem = false;
//   Duration defaultDuration = Duration(milliseconds: 1);
//   String? ind;
//   int currentIndex = 0;
//   int dataIndex = 0;
//   @override
//   void initState() {
//     setState(() {
//       currentIndex = widget.index - 1;
//       dataIndex = widget.index - 1;
//     });
//     if (widget.index < 10) {
//       ind = "00" + (widget.index.toString());
//     } else if (widget.index < 100) {
//       ind = "00" + (widget.index.toString());
//     } else if (widget.index > 100) {
//       ind = (widget.index.toString());
//     }
//     // _initAudioPlayer(ind!, widget.qari);
//     print("Index ${widget.index} current index ${currentIndex}");
//     super.initState();
//   }

//   @override
//   void dispose() {
//     player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Text('Audio Screen'),
//         ),
//       ),
//     );
//   }
// }

import 'package:al_quran_app/models/qari.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../models/surah_model.dart';

class AudioScreen extends StatefulWidget {
  final QariModel qari;
  final int index;
  final List<Surah>? list;

  const AudioScreen(
      {super.key, required this.index, this.list, required this.qari});
  @override
  // ignore: library_private_types_in_public_api
  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer
        .setAudioSource(ConcatenatingAudioSource(children: [
      AudioSource.uri(Uri.parse(widget.qari.path.toString())),
      AudioSource.uri(Uri.parse(
          "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3")),
      AudioSource.uri(Uri.parse(
          "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3")),
      AudioSource.uri(Uri.parse(
          "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3")),
    ]))
        .catchError((error) {
      // catch load errors: 404, invalid url ...
      throw "An error occured $error";
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PlayerButtons(
          _audioPlayer,
        ),
      ),
    );
  }
}

class PlayerButtons extends StatelessWidget {
  const PlayerButtons(
    this._audioPlayer,
  ) : super(key: null);

  final AudioPlayer _audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<bool>(
          stream: _audioPlayer.shuffleModeEnabledStream,
          builder: (context, snapshot) {
            return _shuffleButton(context, snapshot.data ?? false);
          },
        ),
        StreamBuilder<SequenceState>(
          stream: _audioPlayer.sequenceStateStream.cast(),
          builder: (_, __) {
            return _previousButton();
          },
        ),
        StreamBuilder<PlayerState>(
          stream: _audioPlayer.playerStateStream,
          builder: (_, snapshot) {
            final playerState = snapshot.data;
            return _playPauseButton(playerState!);
          },
        ),
        StreamBuilder<SequenceState>(
          stream: _audioPlayer.sequenceStateStream.cast(),
          builder: (_, __) {
            return _nextButton();
          },
        ),
        StreamBuilder<LoopMode>(
          stream: _audioPlayer.loopModeStream,
          builder: (context, snapshot) {
            return _repeatButton(context, snapshot.data ?? LoopMode.off);
          },
        ),
      ],
    );
  }

  Widget _playPauseButton(PlayerState playerState) {
    final processingState = playerState.processingState;
    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        width: 64.0,
        height: 64.0,
        child: const CircularProgressIndicator(),
      );
    } else if (_audioPlayer.playing != true) {
      return IconButton(
        icon: const Icon(Icons.play_arrow),
        iconSize: 64.0,
        onPressed: _audioPlayer.play,
      );
    } else if (processingState != ProcessingState.completed) {
      return IconButton(
        icon: const Icon(Icons.pause),
        iconSize: 64.0,
        onPressed: _audioPlayer.pause,
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.replay),
        iconSize: 64.0,
        onPressed: () => _audioPlayer.seek(Duration.zero,
            index: _audioPlayer.effectiveIndices!.first),
      );
    }
  }

  Widget _shuffleButton(BuildContext context, bool isEnabled) {
    return IconButton(
      icon: isEnabled
          ? Icon(Icons.shuffle, color: Theme.of(context).backgroundColor)
          : const Icon(Icons.shuffle),
      onPressed: () async {
        final enable = !isEnabled;
        if (enable) {
          await _audioPlayer.shuffle();
        }
        await _audioPlayer.setShuffleModeEnabled(enable);
      },
    );
  }

  Widget _previousButton() {
    return IconButton(
      icon: const Icon(Icons.skip_previous),
      onPressed: _audioPlayer.hasPrevious ? _audioPlayer.seekToPrevious : null,
    );
  }

  Widget _nextButton() {
    return IconButton(
      icon: const Icon(Icons.skip_next),
      onPressed: _audioPlayer.hasNext ? _audioPlayer.seekToNext : null,
    );
  }

  Widget _repeatButton(BuildContext context, LoopMode loopMode) {
    final icons = [
      const Icon(Icons.repeat),
      Icon(Icons.repeat, color: Theme.of(context).backgroundColor),
      Icon(Icons.repeat_one, color: Theme.of(context).backgroundColor),
    ];
    const cycleModes = [
      LoopMode.off,
      LoopMode.all,
      LoopMode.one,
    ];
    final index = cycleModes.indexOf(loopMode);
    return IconButton(
      icon: icons[index],
      onPressed: () {
        _audioPlayer.setLoopMode(
            cycleModes[(cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
      },
    );
  }
}
