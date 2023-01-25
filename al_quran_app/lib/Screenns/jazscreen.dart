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
