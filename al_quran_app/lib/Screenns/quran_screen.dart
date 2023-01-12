import 'package:al_quran_app/Constants/constants.dart';
import 'package:al_quran_app/Screenns/jazscreen.dart';
import 'package:al_quran_app/Screenns/surahdetailscreen.dart';
import 'package:al_quran_app/services/api_services.dart';
import 'package:al_quran_app/widgets/future_builder.dart';
import 'package:al_quran_app/widgets/surahcustomlisttile.dart';
import 'package:flutter/material.dart';

import '../models/surah_model.dart';

class Quran_Screen extends StatefulWidget {
  const Quran_Screen({super.key});

  @override
  State<Quran_Screen> createState() => _Quran_ScreenState();
}

class _Quran_ScreenState extends State<Quran_Screen> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      animationDuration: const Duration(
        seconds: 1,
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Quran'),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Text(
                'Surah',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                'Sajda',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                'Jaz',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              FutureBuilder(
                future: apiServices.getSurahList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Surah>> snapshot) {
                  if (snapshot.hasData) {
                    List<Surah>? surah = snapshot.data;
                    return ListView.builder(
                      itemCount: surah!.length,
                      itemBuilder: ((context, index) => SurahCustomListTile(
                            surah: surah[index],
                            buildContext: context,
                            ontap: () {
                              setState(() {
                                Constants.surahIndex = (index + 1);
                              });
                              Navigator.pushNamed(
                                  context, SurahDetails.surahId);
                            },
                          )),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                },
              ),
              SajdaTile(),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              Constants.judgeIndex = (index + 1);
                            });
                            Navigator.pushNamed(context, JazScreen.jazId);
                          },
                          child: Card(
                            elevation: 4,
                            color: Colors.blueGrey,
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
