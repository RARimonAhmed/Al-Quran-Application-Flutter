// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:math';

import 'package:al_quran_app/models/ayah_of_the_day.dart';
import 'package:al_quran_app/models/jaz.dart';
import 'package:al_quran_app/models/qari.dart';
import 'package:al_quran_app/models/trnaslation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../models/audio_file_model.dart';
import '../models/prayer_model.dart';
import '../models/sajda_model.dart';
import '../models/surah_model.dart';

class ApiServices {
  var year = DateFormat.y().format(DateTime.now());
  var month = DateFormat.M().format(DateTime.now());
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
    var rn = Random();
    return min + rn.nextInt(max - min);
  }

  Future<List<Surah>> getSurahList() async {
    Response response = await http.get(Uri.parse(endpointUrl));

    if (response.statusCode == 200) {
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
      return surahList;
    } else {
      throw 'Can\'t get a surah';
    }
  }

  Future<SajdaModel> getSajda() async {
    String url = 'https://api.alquran.cloud/v1/sajda/quran-uthmani';
    Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return SajdaModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Get Exeption');
    }
  }

  Future<JuzModel> getJuz(int index) async {
    String Url = 'http://api.alquran.cloud/v1/juz/$index/quran-uthmani';
    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      return JuzModel.fromJSON(json.decode(response.body));
    } else {
      const CircularProgressIndicator(
        color: Colors.red,
      );
      throw Exception('Failed to load post');
    }
  }

  Future<SurahTranslationList> getSurahTranslation(
      int index, int translationIndex) async {
    String lan = "";
    if (translationIndex == 0) {
      lan = "english_saheeh";
    } else if (translationIndex == 1) {
      lan = "urdu_junagarhi";
    } else if (translationIndex == 2) {
      lan = "hindi_omari";
    }
    final Url = 'https://quranenc.com/api/v1/translation/sura/$lan/$index';
    var response = await http.get(Uri.parse(Url));
    return SurahTranslationList.fromJSON(jsonDecode(response.body));
  }

  List<QariModel> qariList = [];
  Future<List<QariModel>> getQariList() async {
    // For audio link
    // const audioUrl = "https://quranicaudio.com/api/audio_files";
    // const surahsoUrl = "https://quranicaudio.com/api/surahs";
    // const sectionsUrl = "https://quranicaudio.com/api/sections";

    const url = "https://quranicaudio.com/api/qaris";
    final res = await http.get(Uri.parse(url));
    jsonDecode(res.body).forEach((element) {
      if (qariList.length < 155) {
        qariList.add(QariModel.fromJSON(element));
      }
    });
    qariList.sort((a, b) => a.name!.compareTo(b.name!));
    return qariList;
  }

  //For audio playing
  List<AudioFileModel> audioFileList = [];
  Future<List<AudioFileModel>> getAudioiList() async {
    const url = "https://quranicaudio.com/api/audio_files";
    final res = await http.get(Uri.parse(url));
    jsonDecode(res.body).forEach((element) {
      if (res.statusCode == 200) {
        audioFileList.add(AudioFileModel.fromJson(element));
      }
    });
    qariList.sort((a, b) => a.name!.compareTo(b.name!));
    return audioFileList;
  }

  //Prayer Api
  Future<PrayerModel> getPrayerTime() async {
    String prayerUrl =
        'http://api.aladhan.com/v1/calendarByAddress?address=Dhaka&method=2&month=$month&year=$year';
    final response = await http.get(Uri.parse(prayerUrl));
    if (response.statusCode == 200) {
      return PrayerModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception();
    }
  }
}
