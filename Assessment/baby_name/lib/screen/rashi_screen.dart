import 'package:flutter/material.dart';


class RashiScreen extends StatelessWidget {
  final List<String> English = [
    "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo",
    "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"
  ];

  final List<String> Hindi = [
    "मेष", "वृषभ", "मिथुन", "कर्क", "सिंह", "कन्या",
    "तुला", "वृश्चिक", "धनु", "मकर", "कुंभ", "मीन"
  ];

  final List<String> Gujarati = [
    "મેષ", "વૃષભ", "મિથુન", "કર્ક", "સિંહ", "કન્યા",
    "તુલા", "વૃશ્ચિક", "ધન", "મકર", "કુંભ", "મીન"
  ];

  final List<String> iconPaths = [
    "assets/rashi/aries.png",
    "assets/rashi/taurus.png",
    "assets/rashi/gemini.png",
    "assets/rashi/cancer.png",
    "assets/rashi/leo.png",
    "assets/rashi/virgo.png",
    "assets/rashi/libra.png",
    "assets/rashi/scorpio.png",
    "assets/rashi/sagittarius.png",
    "assets/rashi/capricorn.png",
    "assets/rashi/aquarius.png",
    "assets/rashi/pisces.png"
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rashi Screen', style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: Icon(Icons.star, color: Colors.white),
              onPressed: () {
                // Action for the star icon (future feature)
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Hindi'),
              Tab(text: 'Gujarati'),
              Tab(text: 'English'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RashiList(rashis: Hindi, iconPaths: iconPaths),
            RashiList(rashis: Gujarati, iconPaths: iconPaths),
            RashiList(rashis: English, iconPaths: iconPaths),
          ],
        ),
      ),
    );
  }
}

class RashiList extends StatelessWidget {
  final List<String> rashis;
  final List<String> iconPaths;

  RashiList({required this.rashis, required this.iconPaths});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      itemCount: rashis.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 6),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            leading: Image.asset(
              iconPaths[index],
              width: 50,
              height: 50,
            ),
            title: Text(
              rashis[index],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            /*trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey[600],
            ),*/
          ),
        );
      },
    );
  }
}
