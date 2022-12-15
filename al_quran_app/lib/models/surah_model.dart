class Surah {
  int? number, numberOfAyahs;
  String? name, englishName, englishNameTranslation, revelationType;
  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
  });
  factory Surah.fromJSON(Map<String, dynamic> json) {
    return Surah(
        number: json['number'],
        name: json['name'],
        englishName: json['englishName'],
        englishNameTranslation: json['englishNameTranslation'],
        numberOfAyahs: json['numberOfAyahs'],
        revelationType: json['revelationType']);
  }
}
