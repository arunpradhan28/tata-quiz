import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Model/quiz_model.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ParticleOptions particles = const ParticleOptions(
      baseColor: Colors.purpleAccent,
      spawnOpacity: 0.0,
      opacityChangeRate: 0.25,
      minOpacity: 0.1,
      maxOpacity: 0.4,
      particleCount: 70,
      spawnMaxRadius: 15.0,
      spawnMaxSpeed: 100.0,
      spawnMinSpeed: 30,
      spawnMinRadius: 7.0,
    );
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: null,
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options: particles),
        child: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Center(
              child: FutureBuilder<List<QuizResponse>>(
                  future: readJsonDataaTwo(),
                  builder: (context, snapshotData) {
                    var items = snapshotData.data;
                    if (!snapshotData.hasData) {
                      return Container();
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "YOUR SCORE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "2",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }

  Future<List<QuizResponse>> readJsonDataaTwo() async {
    final jsondata = await rootBundle.loadString('assets/secondjson.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => QuizResponse.fromJson(e)).toList();
  }
}
