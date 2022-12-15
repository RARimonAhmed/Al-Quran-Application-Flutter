import 'dart:convert';
import 'dart:math';

import 'package:al_quran_app/models/ayah_of_the_day.dart';
import 'package:al_quran_app/models/jaz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/surah_model.dart';

class ApiServices {
  final endpointUrl = 'http://api.alquran.cloud/v1/surah';
  List<Surah> surahList = [];
  Future<AyahOfTheDay> getAyahOfTheDay() async {
    String url =
        'http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return AyahOfTheDay.fromJSON(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  Future<List<Surah>> getSurahList() async {
    Response response = await http.get(Uri.parse(endpointUrl));

    if (response.statusCode == 200) {
      print('Surah List');
      Map<String, dynamic> json = jsonDecode(response.body);
      var suraJSONArr = json["data"];
      for (var singleSura in suraJSONArr) {
        if (surahList.length < 114) {
          Surah surah = Surah(
              number: singleSura['number'],
              name: singleSura['name'],
              englishName: singleSura['englishName'],
              englishNameTranslation: singleSura['englishNameTranslation'],
              numberOfAyahs: singleSura['numberOfAyahs'],
              revelationType: singleSura['revelationType']);
          surahList.add(surah);
        }
      }
      print(surahList);
      return surahList;
    } else {
      throw 'Can\'t get a surah';
    }
  }

  Future<JuzModel> getJuz(int index) async {
    String Url = 'http://api.alquran.cloud/v1/juz/${index}/quran-uthmani';
    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      print('from getJuzz');
      return JuzModel.fromJSON(json.decode(response.body));
    } else {
      print('Failed to load');
      const CircularProgressIndicator(
        color: Colors.red,
      );
      throw Exception('Failed to load post');
    }
  }
}
