import 'dart:async';
import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Landingpage/landing_page.dart';
import 'package:flutter_application_1/Landingpage/quiz_screen_next.dart';
import 'package:flutter_application_1/Landingpage/quiz_screen_second.dart';
import 'package:flutter_application_1/Screen/score_screen.dart';
import 'package:flutter_application_1/Screen/success.dart';
import 'package:flutter_flip_view/flutter_flip_view.dart';

import '../Screen/count.dart';
import '../Model/quiz_model.dart';

class QuizScreenLast extends StatefulWidget {
  const QuizScreenLast({Key? key}) : super(key: key);

  @override
  State<QuizScreenLast> createState() => _QuizScreenLastState();
}

class _QuizScreenLastState extends State<QuizScreenLast>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  bool isTimeout = true;
  static bool? inNextQuestion;
  static bool? inNextQuestion2;
  static bool? inNextQuestion3;
  static bool? inNextQuestion4;
  static bool? isWrong = false;
  static bool? isPressed = false;
  static bool? isPressed2 = false;
  static bool? isPressed3 = false;
  static bool? isPressed4 = false;
  static bool? isDisable = false;

  Timer? _timer;
  late AnimationController _animationController;
  Animation<double>? _curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isWrong = false;
      isPressed = false;
      isPressed2 = false;
      isPressed3 = false;
      isPressed4 = false;
      isDisable = false;
    });

    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    // readJson();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _flip(bool reverse) {
    if (_animationController.isAnimating) return;
    if (reverse) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 29), () {
      setState(() {
        isTimeout = false;
      });
    });

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
            child: FutureBuilder<List<QuizResponse>>(
          future: readJsonDataaTwo(),
          builder: (context, snapshotData) {
            var items = snapshotData.data;
            if (!snapshotData.hasData) {
              return Container();
            }
            return Column(
              children: [
                Text('Oh My Quiz !!',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    items?.first.data!.stimulus ?? 'No Data',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: CountDownTimerApp(),
                  ),
                ),
                Visibility(
                  visible: isTimeout,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: isDisable == true
                                  ? null
                                  : () {
                                      if (isPressed != true) {
                                        if (items?.first.data?.options![0]
                                                .isCorrect ==
                                            1) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ScoreScreen(),
                                              ));
                                          setState(() {
                                            inNextQuestion2 = true;
                                          });
                                        } else {
                                          setState(() {
                                            // isPressed = true;
                                            isPressed = true;
                                          });
                                        }
                                      }
                                      if (isPressed == true ||
                                          isPressed2 == true ||
                                          isPressed3 == true ||
                                          isPressed4 == true) {
                                        if (items?.first.data?.options![0]
                                                .isCorrect !=
                                            1) {
                                          setState(() {
                                            isDisable = true;
                                            isPressed = true;
                                          });
                                        }
                                      }
                                    },
                              child: isPressed == true
                                  ? _optionButton(
                                      " ${items?.first.data?.options![0].label} ",
                                      'A',
                                      Colors.teal,
                                      Colors.red)
                                  : _optionButton(
                                      " ${items?.first.data?.options![0].label} ",
                                      'A',
                                      Colors.teal,
                                      Colors.white)),
                          InkWell(
                              onTap: isDisable == true
                                  ? null
                                  : () {
                                      if (isPressed != true) {
                                        if (items?.first.data?.options![1]
                                                .isCorrect ==
                                            1) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ScoreScreen(),
                                              ));
                                          setState(() {
                                            inNextQuestion2 = true;
                                          });
                                        } else {
                                          setState(() {
                                            // isPressed = true;
                                            isPressed2 = true;
                                          });
                                        }
                                      }
                                      if (isPressed == true ||
                                          isPressed2 == true ||
                                          isPressed3 == true ||
                                          isPressed4 == true) {
                                        if (items?.first.data?.options![1]
                                                .isCorrect !=
                                            1) {
                                          setState(() {
                                            isDisable = true;
                                            isPressed2 = true;
                                          });
                                        }
                                      }
                                    },
                              child: isPressed2 == true
                                  ? _optionButton(
                                      "${items?.first.data?.options![1].label}",
                                      'B',
                                      Colors.pink,
                                      Colors.red)
                                  : _optionButton(
                                      "${items?.first.data?.options![1].label}",
                                      'B',
                                      Colors.pink,
                                      Colors.white)),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: isDisable == true
                                ? null
                                : () {
                                    if (isPressed != true) {
                                      if (items?.first.data?.options![2]
                                              .isCorrect ==
                                          1) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ScoreScreen(),
                                            ));
                                        setState(() {
                                          inNextQuestion2 = true;
                                        });
                                      } else {
                                        setState(() {
                                          // isPressed = true;
                                          isPressed3 = true;
                                        });
                                      }
                                    }
                                    if (isPressed == true ||
                                        isPressed2 == true ||
                                        isPressed3 == true ||
                                        isPressed4 == true) {
                                      if (items?.first.data?.options![2]
                                              .isCorrect !=
                                          1) {
                                        setState(() {
                                          isDisable = true;
                                          isPressed3 = true;
                                        });
                                      }
                                    }
                                  },
                            child: (isPressed3 == true)
                                ? _optionButton(
                                    "${items?.first.data?.options![2].label}",
                                    'C',
                                    Colors.green,
                                    Colors.red)
                                : (inNextQuestion3 == true)
                                    ? _optionButton(
                                        "${items?.first.data?.options![2].label}",
                                        'C',
                                        Colors.greenAccent,
                                        Colors.white)
                                    /* FlipView(
                                        animationController: _curvedAnimation,
                                        front: _optionButton(
                                            "${items?.first.data?.options![2].label}",
                                            'C',
                                            Colors.greenAccent,
                                            Colors.green),
                                        back: _optionButton(
                                            "${items?.first.data?.options![2].label}",
                                            'C',
                                            Colors.green,
                                            Colors.green),
                                      ) */
                                    : _optionButton(
                                        "${items?.first.data?.options![2].label}",
                                        'C',
                                        Colors.greenAccent,
                                        Colors.white),
                          ),
                          InkWell(
                            onTap: isDisable == true
                                ? null
                                : () {
                                    if (items?.first.data?.options![3]
                                            .isCorrect ==
                                        1) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ScoreScreen(),
                                          ));
                                      setState(() {
                                        inNextQuestion2 = true;
                                      });
                                    } else {
                                      setState(() {
                                        // isPressed = true;
                                        isPressed4 = true;
                                      });
                                    }
                                    if (isPressed == true ||
                                        isPressed2 == true ||
                                        isPressed3 == true ||
                                        isPressed4 == true) {
                                      if (items?.first.data?.options![3]
                                              .isCorrect !=
                                          1) {
                                        setState(() {
                                          isDisable = true;
                                          isPressed4 = true;
                                        });
                                      }
                                    }
                                  },
                            child: isPressed4 == true
                                ? _optionButton(
                                    "${items?.first.data?.options![3].label}",
                                    'D',
                                    Colors.orange,
                                    Colors.red)
                                : _optionButton(
                                    "${items?.first.data?.options![3].label}",
                                    'D',
                                    Colors.orange,
                                    Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        )),
      ),
    );
  }

  Widget _optionButton(
      String optionText, String optionType, Color color, Color? bgcolor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // color: Colors.white,
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), // radius of 10
            color: bgcolor // green as background color
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
