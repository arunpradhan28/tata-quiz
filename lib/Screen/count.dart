import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/show_count.dart';



class CountDownTimerApp extends StatelessWidget {
  const CountDownTimerApp( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ShowCircularCountDownTimer(),
      theme: ThemeData.light(),
    );
  }
}