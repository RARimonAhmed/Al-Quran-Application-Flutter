import 'package:al_quran_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constants/constants.dart';
import '../controllers/prayer_screen_controller.dart';
import '../models/prayer_model.dart';

class CustomListTile extends StatelessWidget {
  final Color tilecolors;
  final String wakth, timeText;
  final int firstHour, secondHour, firstMinute, secondMinute;
  const CustomListTile(
      {super.key,
      required this.tilecolors,
      required this.wakth,
      required this.firstHour,
      required this.secondHour,
      required this.firstMinute,
      required this.secondMinute,
      required this.timeText});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    return Column(
      children: [
        ListTile(
          tileColor: tilecolors,
          leading: Text(
            textAlign: TextAlign.center,
            timeText,
            style: const TextStyle(
              fontSize: 20,
              color: Constants.kPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          title: Text(
            wakth,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.redAccent,
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: PrayerController(
            hour: firstHour - secondHour,
            minute: firstMinute - secondMinute,
            second: 0,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
