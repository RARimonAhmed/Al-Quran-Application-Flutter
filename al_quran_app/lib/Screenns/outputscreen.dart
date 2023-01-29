// import 'package:al_quran_app/Constants/constants.dart';
// import 'package:al_quran_app/services/api_services.dart';
// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:just_audio_background/just_audio_background.dart';
// import 'package:rxdart/rxdart.dart';

// import '../controllers/player_controllers.dart';

// class MusicPlayer extends StatefulWidget {
//   const MusicPlayer({super.key});

//   @override
//   State<MusicPlayer> createState() => _MusicPlayerState();
// }

// class PossitionData {
//   final Duration possition;
//   final Duration bufferedDuration;
//   final Duration duration;

//   PossitionData(this.possition, this.bufferedDuration, this.duration);
// }

// class _MusicPlayerState extends State<MusicPlayer> {
//   ApiServices apiServices = ApiServices();
//   late AudioPlayer audioPlayer;

//   final playList = ConcatenatingAudioSource(
//     children: [
//       AudioSource.uri(
//         Uri.parse(
//             "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3"),
//         tag: const MediaItem(id: '0', title: 'Nature', artist: 'Rimon'),
//       ),
//       AudioSource.uri(
//         Uri.parse(
//           "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3",
//         ),
//         tag: const MediaItem(id: '1', title: 'Love', artist: 'Raj'),
//       ),
//       AudioSource.uri(
//         Uri.parse(
//             "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3"),
//         tag: const MediaItem(id: '2', title: 'Respect', artist: 'Rayhan'),
//       ),
//     ],
//   );
//   Stream<PossitionData> get possitionDataStream =>
//       Rx.combineLatest3<Duration, Duration, Duration?, PossitionData>(
//         audioPlayer.positionStream,
//         audioPlayer.bufferedPositionStream,
//         audioPlayer.durationStream,
//         (possition, bufferedPossition, duration) => PossitionData(
//           possition,
//           bufferedPossition,
//           duration ?? Duration.zero,
//         ),
//       );
//   @override
//   void initState() {
//     super.initState();
//     audioPlayer = AudioPlayer();
//     _init();
//     // This code for asset
//     // audioPlayer = AudioPlayer()..setAsset('assets/audios/jhoom.mp3');

//     // String urls =
//     //     'https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3';
//     // audioPlayer = AudioPlayer()..setUrl(urls);

//     // audioPlayer.positionStream;
//     // audioPlayer.bufferedPositionStream;
//     // audioPlayer.durationStream;
//   }

//   Future<void> _init() async {
//     await audioPlayer.setLoopMode(LoopMode.all);
//     await audioPlayer.setAudioSource(playList);
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Constants.kPrimary,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.volume_mute),
//           onPressed: () {
//             audioPlayer.volume.sign;
//           },
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         height: double.infinity,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF144771), Color(0xFF071A2C)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StreamBuilder<PossitionData>(
//                 stream: possitionDataStream,
//                 builder: (context, snapshot) {
//                   final possitionData = snapshot.data;
//                   return ProgressBar(
//                     barHeight: 8,
//                     baseBarColor: Colors.grey[600],
//                     bufferedBarColor: Colors.grey,
//                     progressBarColor: Colors.red,
//                     thumbColor: Colors.red,
//                     timeLabelTextStyle: const TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.w600),
//                     progress: possitionData?.possition ?? Duration.zero,
//                     buffered: possitionData?.bufferedDuration ?? Duration.zero,
//                     total: possitionData?.duration ?? Duration.zero,
//                     onSeek: audioPlayer.seek,
//                   );
//                 }),
//             PlayerControllers(audioPlayer: audioPlayer),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

// import 'package:music_player_from_all/models/prayer_model.dart';
import 'package:rxdart/rxdart.dart';

import '../controllers/player_controllers.dart';
// import 'package:http/http.dart' as http;

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class PossitionData {
  final Duration possition;
  final Duration bufferedDuration;
  final Duration duration;

  PossitionData(this.possition, this.bufferedDuration, this.duration);
}

class _MusicPlayerState extends State<MusicPlayer> {
  late AudioPlayer audioPlayer;

  final playList = ConcatenatingAudioSource(
    children: [
      // AudioSource.uri(
      //   Uri.parse(AudioFileModel().fileName.toString()),
      //   tag: MediaItem(id: '0', title: 'Nature', artist: 'Rimon'),
      // ),
      AudioSource.uri(
        Uri.parse(
            "https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3"),
        tag: const MediaItem(id: '0', title: 'Nature', artist: 'Rimon'),
      ),
      // AudioSource.uri(
      //   Uri.parse("https://archive.org/details/001.mp3_307"),
      //   tag: MediaItem(id: '1', title: 'Nature', artist: 'Rimon'),
      // ),
      AudioSource.uri(
        Uri.parse(
          "https://archive.org/download/igm-v8_202101/IGM%20-%20Vol.%208/15%20Pokemon%20Red%20-%20Cerulean%20City%20%28Game%20Freak%29.mp3",
        ),
        tag: const MediaItem(id: '1', title: 'Nature', artist: 'Rimon'),
      ),
      AudioSource.uri(
        Uri.parse(
            "https://scummbar.com/mi2/MI1-CD/01%20-%20Opening%20Themes%20-%20Introduction.mp3"),
        tag: const MediaItem(id: '2', title: 'Nature', artist: 'Rimon'),
      ),
    ],
  );
  Stream<PossitionData> get possitionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PossitionData>(
        audioPlayer.positionStream,
        audioPlayer.bufferedPositionStream,
        audioPlayer.durationStream,
        (possition, bufferedPossition, duration) => PossitionData(
          possition,
          bufferedPossition,
          duration ?? Duration.zero,
        ),
      );
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _init();
    // audioPlayer = AudioPlayer()..setAsset('assets/audios/jhoom.mp3');

    // String urls =
    //     'https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3';
    // audioPlayer = AudioPlayer()..setUrl(urls);

    // audioPlayer.positionStream;
    // audioPlayer.bufferedPositionStream;
    // audioPlayer.durationStream;
  }

  Future<void> _init() async {
    await audioPlayer.setLoopMode(LoopMode.all);
    await audioPlayer.setAudioSource(playList);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  // void getData() async {
  //   print("From get data");
  //   var response = await http
  //       .get(Uri.parse("https://api.alquran.cloud/v1/sajda/quran-uthmani"));
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     var data = response.body;
  //     print(data);
  //     // do something with the data
  //   } else {
  //     // handle error
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: (() {}), icon: const Icon(Icons.more_horiz_rounded)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF144771), Color(0xFF071A2C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<PossitionData>(
                stream: possitionDataStream,
                builder: (context, snapshot) {
                  final possitionData = snapshot.data;
                  return ProgressBar(
                    barHeight: 8,
                    baseBarColor: Colors.grey[600],
                    bufferedBarColor: Colors.grey,
                    progressBarColor: Colors.red,
                    thumbColor: Colors.red,
                    timeLabelTextStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    progress: possitionData?.possition ?? Duration.zero,
                    buffered: possitionData?.bufferedDuration ?? Duration.zero,
                    total: possitionData?.duration ?? Duration.zero,
                    onSeek: audioPlayer.seek,
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            PlayerControllers(audioPlayer: audioPlayer),
          ],
        ),
      ),

      //     FutureBuilder(
      //   future: apiServices.getPrayerTime(),
      //   builder:
      //       ((BuildContext context, AsyncSnapshot<PrayerModel> snapshot) {
      //     // getData();
      //     apiServices.getPrayerTime();
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //           itemCount: 1,
      //           itemBuilder: ((context, index) {
      //             return ListTile(
      //               title: Text(
      //                   snapshot.data!.data![index].timings!.fajr.toString()),
      //             );
      //           }));
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   }),
      // ),
    );
  }
}
