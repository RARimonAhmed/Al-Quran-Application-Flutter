import 'package:al_quran_app/services/api_services.dart';
import 'package:al_quran_app/widgets/qaricustomtile.dart';
import 'package:flutter/material.dart';
import '../models/qari.dart';
import 'audio_surah_screen.dart';

class QariListScreen extends StatefulWidget {
  const QariListScreen({super.key});

  @override
  State<QariListScreen> createState() => _QariListScreenState();
}

class _QariListScreenState extends State<QariListScreen> {
  ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Qari's"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 12,
            right: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 0,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Row(
                    children: const [
                      Text('Search'),
                      Spacer(),
                      Icon(
                        Icons.search_off_rounded,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder(
                    future: apiServices.getQariList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Qari>> snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('Internet is not connection'),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          return QariCustomTile(
                              qari: snapshot.data![index],
                              ontap: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AudioSurahScreen(
                                        qari: snapshot.data![index]),
                                  ),
                                );
                              }));
                        }),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
