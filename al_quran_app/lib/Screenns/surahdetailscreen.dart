import 'package:al_quran_app/models/trnaslation.dart';
import 'package:al_quran_app/widgets/custom_translation.dart';
import 'package:al_quran_app/widgets/surahcustomlisttile.dart';
import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import '../services/api_services.dart';

class SurahDetails extends StatefulWidget {
  const SurahDetails({super.key});
  static const String surahId = 'Surah Details';

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: apiServices.getSurahTranslation(Constants.surahIndex!),
            builder: (BuildContext context,
                AsyncSnapshot<SurahTranslationList> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    value: 30,
                    color: Colors.red,
                  ),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.translationList.length,
                    itemBuilder: (context, index) {
                      return TranslationTile(
                          index: index,
                          surahTranslation:
                              snapshot.data!.translationList[index]);
                    });
              } else {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.not_interested),
                      Text('Translation not found!'),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
