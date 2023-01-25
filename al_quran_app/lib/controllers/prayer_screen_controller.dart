import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:just_audio/just_audio.dart';

class Example extends StatelessWidget {
  // Duration durations;
  final int hour, minute, second;
  const Example(
      {super.key,
      required this.hour,
      required this.minute,
      required this.second});

  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer()..setAsset('images/ajan.mp3');
    return TimerCountdown(
      spacerWidth: 0,
      format: CountDownTimerFormat.daysHoursMinutesSeconds,
      endTime: DateTime.now().subtract(
        Duration(
          days: 0,
          hours: hour,
          minutes: minute,
          seconds: second,
        ),
      ),
      onEnd: () {
        audioPlayer.play();
        print("Timer finished");
      },
    );
  }
}
