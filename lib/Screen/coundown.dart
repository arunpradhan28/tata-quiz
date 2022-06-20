import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_application_1/Landingpage/quiz_screen.dart';
import 'package:flutter_application_1/Screen/alert_screen.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CircularCountDownTimerWidget extends StatefulWidget {
  CircularCountDownTimerWidget({
    Key? key,
    required CountDownController controller,
  })  : _countDownController = controller,
        super(key: key);

  final CountDownController _countDownController;

  @override
  _CircularCountDownTimerWidgetState createState() =>
      _CircularCountDownTimerWidgetState();
}

class _CircularCountDownTimerWidgetState
    extends State<CircularCountDownTimerWidget> {
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      descTextAlign: TextAlign.start,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
      alertAlignment: Alignment.topCenter,
    );
    return CircularCountDownTimer(
      width: 200,
      height: 200,
      duration: 30,
      fillColor: Colors.redAccent,
      ringColor: Colors.white38,
      controller: widget._countDownController,
      backgroundColor: Colors.amber,
      strokeWidth: 10.0,
      strokeCap: StrokeCap.round,
      isReverse: true,
      onComplete: () {
        setState(() {
          isComplete = true;
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AlertScreen()));
      },
      textStyle: GoogleFonts.aclonica(
        fontSize: 70.0,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }
}
