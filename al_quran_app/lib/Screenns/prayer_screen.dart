import 'package:al_quran_app/services/api_services.dart';
import 'package:al_quran_app/widgets/custom_list_tile.dart';
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomListTile(
                          tilecolors: Colors.lightBlue,
                          wakth: 'Fajr',
                          firstHour: (int.parse(snapshot
                              .data!.data![index].timings!.fajr
                              .toString()
                              .substring(0, 2))),
                          secondHour: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          firstMinute: int.parse(snapshot
                              .data!.data![index].timings!.fajr
                              .toString()
                              .substring(3, 5)),
                          secondMinute: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          timeText: snapshot.data!.data![index].timings!.fajr
                              .toString(),
                        ),
                        CustomListTile(
                          tilecolors: Colors.indigo,
                          wakth: 'Sunrise',
                          firstHour: (int.parse(snapshot
                              .data!.data![index].timings!.sunrise
                              .toString()
                              .substring(0, 2))),
                          secondHour: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          firstMinute: int.parse(snapshot
                              .data!.data![index].timings!.sunrise
                              .toString()
                              .substring(3, 5)),
                          secondMinute: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          timeText: snapshot.data!.data![index].timings!.sunrise
                              .toString(),
                        ),
                        CustomListTile(
                          tilecolors: Colors.lightGreen,
                          wakth: 'Dhuhr',
                          firstHour: (int.parse(snapshot
                              .data!.data![index].timings!.dhuhr
                              .toString()
                              .substring(0, 2))),
                          secondHour: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          firstMinute: int.parse(snapshot
                              .data!.data![index].timings!.dhuhr
                              .toString()
                              .substring(3, 5)),
                          secondMinute: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          timeText: snapshot.data!.data![index].timings!.dhuhr
                              .toString(),
                        ),
                        CustomListTile(
                          tilecolors: Colors.orangeAccent,
                          wakth: 'Asr',
                          firstHour: (int.parse(snapshot
                              .data!.data![index].timings!.asr
                              .toString()
                              .substring(0, 2))),
                          secondHour: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          firstMinute: int.parse(snapshot
                              .data!.data![index].timings!.asr
                              .toString()
                              .substring(3, 5)),
                          secondMinute: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          timeText: snapshot.data!.data![index].timings!.asr
                              .toString(),
                        ),
                        CustomListTile(
                          tilecolors: Colors.blue,
                          wakth: 'Sunset',
                          firstHour: (int.parse(snapshot
                              .data!.data![index].timings!.sunset
                              .toString()
                              .substring(0, 2))),
                          secondHour: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          firstMinute: int.parse(snapshot
                              .data!.data![index].timings!.sunset
                              .toString()
                              .substring(3, 5)),
                          secondMinute: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          timeText: snapshot.data!.data![index].timings!.sunset
                              .toString(),
                        ),
                        CustomListTile(
                          tilecolors: Colors.amber,
                          wakth: 'Magrib',
                          firstHour: (int.parse(snapshot
                              .data!.data![index].timings!.maghrib
                              .toString()
                              .substring(0, 2))),
                          secondHour: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          firstMinute: int.parse(snapshot
                              .data!.data![index].timings!.maghrib
                              .toString()
                              .substring(3, 5)),
                          secondMinute: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          timeText: snapshot.data!.data![index].timings!.maghrib
                              .toString(),
                        ),
                        CustomListTile(
                          tilecolors: Colors.purple,
                          wakth: 'Isha',
                          firstHour: (int.parse(snapshot
                              .data!.data![index].timings!.isha
                              .toString()
                              .substring(0, 2))),
                          secondHour: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          firstMinute: int.parse(snapshot
                              .data!.data![index].timings!.isha
                              .toString()
                              .substring(3, 5)),
                          secondMinute: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          timeText: snapshot.data!.data![index].timings!.isha
                              .toString(),
                        ),
                        CustomListTile(
                          tilecolors: Colors.teal,
                          wakth: 'Imsak',
                          firstHour: (int.parse(snapshot
                              .data!.data![index].timings!.imsak
                              .toString()
                              .substring(0, 2))),
                          secondHour: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          firstMinute: int.parse(snapshot
                              .data!.data![index].timings!.imsak
                              .toString()
                              .substring(3, 5)),
                          secondMinute: (int.parse(
                              DateFormat.H().format(DateTime.now()))),
                          timeText: snapshot.data!.data![index].timings!.imsak
                              .toString(),
                        ),
                        CustomListTile(
                          tilecolors: Colors.teal,
                          wakth: 'new',
                          firstHour: 5,
                          secondHour: 4,
                          firstMinute: 5,
                          secondMinute: 3,
                          timeText: snapshot.data!.data![index].timings!.imsak
                              .toString(),
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
