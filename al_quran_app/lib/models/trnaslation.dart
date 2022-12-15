class SurahTranslation {
  String? sura;
  String? aya;
  String? arabic_text;
  String? translation;
  SurahTranslation({
    this.sura,
    this.aya,
    this.arabic_text,
    this.translation,
  });
  factory SurahTranslation.fromJSON(Map<String, dynamic> json) {
    return SurahTranslation(
      sura: json['sura'],
      aya: json['aya'],
      arabic_text: json['arabic_text'],
      translation: json['translation'],
    );
  }
}
