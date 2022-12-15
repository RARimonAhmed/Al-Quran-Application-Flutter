class AyahOfTheDay {
  final String? arText;
  final String? enTrans;
  final String? surName;
  final int? surNumber;
  AyahOfTheDay({
    this.arText,
    this.enTrans,
    this.surName,
    this.surNumber,
  });

  factory AyahOfTheDay.fromJSON(Map<String, dynamic> json) {
    return AyahOfTheDay(
        arText: json['data'][0]['text'],
        enTrans: json['data'][2]['text'],
        surName: json['data'][2]['surah']['englishName'],
        surNumber: json['data'][2]['numberInSurah']);
  }
}
