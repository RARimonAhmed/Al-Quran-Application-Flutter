import 'package:al_quran_app/models/sajda_model.dart';
import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import '../Screenns/surahdetailscreen.dart';
import '../services/api_services.dart';

class SajdaTile extends StatefulWidget {
  const SajdaTile({
    super.key,
  });

  @override
  State<SajdaTile> createState() => _SajdaTileState();
}

class _SajdaTileState extends State<SajdaTile> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiServices.getSajda(),
      builder: (BuildContext context, AsyncSnapshot<SajdaModel> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: 15,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      Constants.surahIndex =
                          snapshot.data?.data!.ayahs![index].numberInSurah;
                    });
                    Navigator.pushNamed(context, SurahDetails.surahId);
                  },
                  child: ListTile(
                    leading: Text(snapshot.data!.data!.ayahs![index].sajda!.id
                        .toString()),
                    title: Text(
                        snapshot.data!.data!.ayahs![index].text.toString()),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(snapshot.data!.data!.ayahs![index].surah!.name
                            .toString()),
                        Text(snapshot
                            .data!.data!.ayahs![index].surah!.englishName
                            .toString()),
                        Text(snapshot.data!.data!.ayahs![index].numberInSurah
                            .toString()),
                      ],
                    ),
                    trailing: Text(snapshot
                        .data!.data!.ayahs![index].sajda!.recommended
                        .toString()),
                  ),
                );
              }));
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}
