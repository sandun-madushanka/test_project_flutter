import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testflutter/providers/countdown_provider.dart';
import 'package:testflutter/screens/widgets/button_primary_rect.dart';
import 'package:testflutter/ui_helpers/colors.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late int _countdown;
  late int _start;

  late Timer _timer;

  @override
  void initState() {
    _countdown = 0;
    getData();
    super.initState();
  }

  getData() async {
    _countdown = await Provider.of<CountdownProvider>(context, listen: false)
        .getCountdownValue();
    _countdown = _start;
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Screen"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Text(
                'Countdown : $_countdown',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonPrimaryRound(
                  btnName: "Go to Counter",
                  isOutlineButton: false,
                  onBtnClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CounterScreen();
                        },
                      ),
                    );
                  },
                  colors: colorGreen),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
