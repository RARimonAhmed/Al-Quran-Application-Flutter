import 'package:al_quran_app/Screenns/audio_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class PrayerController extends StatefulWidget {
  // Duration durations;
  final int hour, minute, second;
  const PrayerController(
      {super.key,
      required this.hour,
      required this.minute,
      required this.second});

  @override
  State<PrayerController> createState() => _PrayerControllerState();
}

class _PrayerControllerState extends State<PrayerController> {
  // final audiPlayer = AudioPlayer();
  // bool isPlaying = false;

  // @override
  // void dispose() {
  //   audiPlayer.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return TimerCountdown(
      spacerWidth: 0,
      format: CountDownTimerFormat.daysHoursMinutesSeconds,
      endTime: DateTime.now().subtract(
        Duration(
          days: 0,
          hours: widget.hour,
          minutes: widget.minute,
          seconds: widget.second,
        ),
      ),
      onEnd: () async {
        Future.delayed(
          const Duration(seconds: 2),
        );
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const MusicPlayer())));
      },
    );
  }
}
