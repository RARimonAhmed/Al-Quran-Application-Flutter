import 'package:al_quran_app/models/trnaslation.dart';
import 'package:al_quran_app/widgets/custom_translation.dart';
import 'package:flutter/material.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../Constants/constants.dart';
import '../services/api_services.dart';

enum Translation {
  english,
  urdu,
  hindi,
}

class SurahDetails extends StatefulWidget {
  const SurahDetails({super.key});
  static const String surahId = 'Surah Details';

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  ApiServices apiServices = ApiServices();
  // SolidController _controller = SolidController();
  Translation? _translation = Translation.urdu;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: apiServices.getSurahTranslation(
                Constants.surahIndex!, _translation!.index),
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
                return Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: ListView.builder(
                      itemCount: snapshot.data!.translationList.length,
                      itemBuilder: (context, index) {
                        return TranslationTile(
                            index: index,
                            surahTranslation:
                                snapshot.data!.translationList[index]);
                      }),
                );
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
        bottomSheet: SolidBottomSheet(
          headerBar: Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            child: const Center(
              child: Text(
                "Swipe me!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('English'),
                      leading: Radio<Translation>(
                        groupValue: _translation,
                        value: Translation.english,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Urdu'),
                      leading: Radio<Translation>(
                        groupValue: _translation,
                        value: Translation.urdu,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Hindi'),
                      leading: Radio<Translation>(
                        groupValue: _translation,
                        value: Translation.hindi,
                        onChanged: (Translation? value) {
                          setState(() {
                            _translation = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
