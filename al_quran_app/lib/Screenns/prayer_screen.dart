import 'package:al_quran_app/Constants/constants.dart';
import 'package:al_quran_app/controllers/prayer_screen_controller.dart';
import 'package:al_quran_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/prayer_model.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    var _dates = DateTime.now();
    var format = DateFormat.jm().format(DateTime.now());
    var formatted = format;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: apiServices.getPrayerTime(),
          builder:
              ((BuildContext context, AsyncSnapshot<PrayerModel> snapshot) {
            apiServices.getPrayerTime();
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        ListTile(
                          tileColor: Colors.blue,
                          leading: Text(
                            snapshot.data!.data![index].timings!.fajr
                                .toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Constants.kPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          title: const Center(
                            child: Text(
                              "Fajr",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          trailing: Example(
                              hour: (int.parse(snapshot
                                      .data!.data![index].timings!.fajr
                                      .toString()
                                      .substring(0, 2))) -
                                  (int.parse(
                                      DateFormat.H().format(DateTime.now()))),
                              minute: int.parse(snapshot
                                      .data!.data![index].timings!.fajr
                                      .toString()
                                      .substring(3, 5)) -
                                  (int.parse(
                                      DateFormat.H().format(DateTime.now()))),
                              second: 0),
                        ),
                        ListTile(
                          tileColor: Colors.blue,
                          leading: Text(
                            snapshot.data!.data![index].timings!.asr.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Constants.kPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          title: const Center(
                            child: Text(
                              "Asr",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          trailing: Example(
                              hour: (int.parse(snapshot
                                  .data!.data![index].timings!.asr
                                  .toString()
                                  .substring(0, 2))),
                              //     -
                              // (int.parse(
                              //     DateFormat.H().format(DateTime.now()))),
                              minute: int.parse(snapshot
                                  .data!.data![index].timings!.asr
                                  .toString()
                                  .substring(3, 5)),
                              //      -
                              // (int.parse(
                              //     DateFormat.H().format(DateTime.now()))),
                              second: 0),
                        ),
                      ],
                    );
                  }));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }
}
