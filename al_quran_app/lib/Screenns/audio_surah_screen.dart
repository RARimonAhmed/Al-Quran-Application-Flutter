import 'package:al_quran_app/Constants/constants.dart';
import 'package:al_quran_app/models/qari.dart';
import 'package:al_quran_app/models/surah_model.dart';
import 'package:al_quran_app/services/api_services.dart';
import 'package:flutter/material.dart';

import 'audio_screen.dart';

class AudioSurahScreen extends StatefulWidget {
  const AudioSurahScreen({super.key, required this.qari});
  final QariModel qari;

  @override
  State<AudioSurahScreen> createState() => _AudioSurahScreenState();
}

class _AudioSurahScreenState extends State<AudioSurahScreen> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Surah List',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder(
            future: apiServices.getSurahList(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
              if (snapshot.hasData) {
                List<Surah>? surah = snapshot.data;
                return ListView.builder(
                    itemCount: surah!.length,
                    itemBuilder: (context, index) => AudioTile(
                        surahName: snapshot.data![index].englishName,
                        totalayah: snapshot.data![index].numberOfAyahs,
                        number: snapshot.data![index].number,
                        ontap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => AudioScreen(
                                        qari: widget.qari,
                                        index: index + 1,
                                        list: surah,
                                      ))));
                        })));
              } else {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.error_rounded,
                        color: Colors.red,
                      ),
                      Text(
                          'Something went wrong!.\nMake sure your net connection.'),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget AudioTile(
    {required String? surahName,
    required totalayah,
    required number,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surahName!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "Total ayath : $totalayah",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.play_circle_fill,
              color: Constants.kPrimary,
            ),
          ],
        ),
      ),
    ),
  );
}
