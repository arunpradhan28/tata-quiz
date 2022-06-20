import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: null,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.warning_rounded,
                size: 90.0,
                color: Colors.red,
              ),
              Text(
                  'TimeOut',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.white)
                ),
            ],
          ),
        ),
      ),
    );
  }
}
