import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';


import 'coundown.dart';

class ShowCircularCountDownTimer extends StatefulWidget {
  const ShowCircularCountDownTimer({Key? key}) : super(key: key);

  @override
  _ShowCircularCountDownTimerState createState() =>
      _ShowCircularCountDownTimerState();
}

class _ShowCircularCountDownTimerState extends State {
  final CountDownController _countDownController = CountDownController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: null,
      body: Center(
        child: CircularCountDownTimerWidget(controller: _countDownController),
      ),
      
    );
  }
}