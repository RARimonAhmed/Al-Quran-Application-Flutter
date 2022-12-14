import 'dart:convert';
import 'dart:math';

import 'package:al_quran_app/models/ayah_of_the_day.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<AyahOfTheDay> getAyahOfTheDay() async {
    String url =
        'http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.statusCode);
      return AyahOfTheDay.fromJSON(json.decode(response.body));
    } else {
      print(response.statusCode);
      print('Failed to load data');
      throw Exception('Failed to load post');
    }
  }

  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }
}
