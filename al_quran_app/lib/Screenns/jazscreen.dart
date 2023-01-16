import 'package:al_quran_app/Constants/constants.dart';
import 'package:al_quran_app/models/jaz.dart';
import 'package:al_quran_app/services/api_services.dart';
import 'package:al_quran_app/widgets/juzzcustomtile.dart';
import 'package:flutter/material.dart';

class JazScreen extends StatefulWidget {
  static const String jazId = 'Juz_Screen';

  const JazScreen({super.key});

  @override
  State<JazScreen> createState() => _JazScreenState();
}

class _JazScreenState extends State<JazScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<JuzModel>(
            future: apiServices.getJuz(Constants.judgeIndex!),
            builder: (BuildContext context, AsyncSnapshot<JuzModel> snapshot) {
              // switch (snapshot.connectionState) {
              //   case ConnectionState.none:
              //     return Icon(Icons.delete_outline);

              //   case ConnectionState.waiting:
              //     return Icon(Icons.circle_notifications);
              //   case ConnectionState.active:
              //     return CircularProgressIndicator(
              //       color: Colors.blueAccent,
              //     );
              //   case ConnectionState.done:
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    value: 30,
                    color: Colors.red,
                  ),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.juzAyahs.length,
                    itemBuilder: (context, index) {
                      return JuzCustomTile(
                          list: snapshot.data!.juzAyahs, index: index);
                    });
              } else {
                return const Center(
                  child: Text('No data found'),
                );
              }
            }),
      ),
    );
  }
}
