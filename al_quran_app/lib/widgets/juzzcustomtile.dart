import 'package:al_quran_app/models/jaz.dart';
import 'package:flutter/material.dart';

class JuzCustomTile extends StatelessWidget {
  final List<JuzAyahs> list;
  final int index;
  const JuzCustomTile({super.key, required this.list, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            list[index].ayahNumber.toString(),
          ),
          Text(
            list[index].ayahsText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.end,
          ),
          Text(
            list[index].surahName,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
