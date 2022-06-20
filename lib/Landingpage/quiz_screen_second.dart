import 'dart:async';
import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screen/score_screen.dart';

import '../Screen/count.dart';
import '../Model/quiz_model.dart';

class QuizScreenTwo extends StatefulWidget {
  const QuizScreenTwo({Key? key}) : super(key: key);

  @override
  State<QuizScreenTwo> createState() => _QuizScreenTwoState();
}

class _QuizScreenTwoState extends State<QuizScreenTwo>
    with SingleTickerProviderStateMixin {
  bool isTimeout = false;
  bool? inNextQuestion;
  Timer? _timer;  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inNextQuestion = false;
    // readJson();
  }

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
      backgroundColor: Colors.amber,
      appBar: null,
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options: particles),
        child: SafeArea(
            child: FutureBuilder<List<QuizResponse>>(
          future: readJsonDataaTwo(),
          builder: (context, snapshotData) {
            var items = snapshotData.data;
            if (!snapshotData.hasData) {
              return Container();
            }
            return Column(
              children: [
                Text(items?.first.instructions ?? 'No Data'),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    items?.first.data!.stimulus ?? 'No Data',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: CountDownTimerApp(),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              if (items?.first.data?.options![0].isCorrect ==
                                  1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ScoreScreen(),
                                  ),
                                );
                                setState(() {
                                  inNextQuestion = true;
                                });
                              }
                            },
                            child: _optionButton(
                                " ${items?.first.data?.options![0].label} ",
                                'A',
                                Colors.teal)),
                        InkWell(
                            onTap: () {
                              if (items?.first.data?.options![1].isCorrect ==
                                  1) {
                                setState(() {
                                  inNextQuestion = true;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ScoreScreen(),
                                  ),
                                );
                              }
                            },
                            child: _optionButton(
                                "${items?.first.data?.options![1].label}",
                                'B',
                                Colors.pink)),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              if (items?.first.data?.options![2].isCorrect ==
                                  1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ScoreScreen(),
                                  ),
                                );
                                setState(() {
                                  inNextQuestion = true;
                                });
                              }
                            },
                            child: _optionButton(
                                "${items?.first.data?.options![2].label}",
                                'C',
                                Colors.green)),
                        InkWell(
                          onTap: () {
                            if (items?.first.data?.options![3].isCorrect == 1) {
                              setState(() {
                                inNextQuestion = true;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ScoreScreen(),
                                ),
                              );
                            }
                          },
                          child: _optionButton(
                              "${items?.first.data?.options![3].label}",
                              'D',
                              Colors.orange),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            );
          },
        )),
      ),
    );
  }

  Widget _optionButton(String optionText, String optionType, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        height: 170,
        width: 170,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    optionType,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                optionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<QuizResponse>> readJsonDataa() async {
    final jsondata = await rootBundle.loadString('assets/firstjson.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => QuizResponse.fromJson(e)).toList();
  }

  Future<List<QuizResponse>> readJsonDataaTwo() async {
    final jsondata = await rootBundle.loadString('assets/secondjson.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => QuizResponse.fromJson(e)).toList();
  }
}
