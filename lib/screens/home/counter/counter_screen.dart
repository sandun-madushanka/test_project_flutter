import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
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
  int _countdown = 0;
  int _start = 0;

  late Timer _timer;

  bool isEnable = true;

  @override
  void initState() {
    _countdown = 0;
    getData();
    super.initState();
  }

  getData() async {
    int val = await Provider.of<CountdownProvider>(context, listen: false)
        .getCountdownValue();
    setState(() {
      _countdown = val;
      _start = _countdown;
    });
  }

  void startTimer() {
    print('call');
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isEnable = true;
            AwesomeNotifications().createNotification(
                content: NotificationContent(
                    id: 10,
                    channelKey: 'basic_channel',
                    title: 'Counter Notification',
                    body: 'Countdown is over'));
          });
        } else {
          setState(() {
            _start--;
            isEnable = false;
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
      body: Provider.of<CountdownProvider>(context, listen: false).isLoading
          ? Center(child: CircularProgressIndicator.adaptive())
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Text(
                      'Time : $_countdown',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Text(
                      'Countdown : $_start',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  isEnable
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ButtonPrimaryRound(
                              btnName: "Start Timer",
                              isOutlineButton: false,
                              onBtnClick: () {
                                startTimer();
                              },
                              colors: colorGreen),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ButtonPrimaryRound(
                              btnName: "Start Timer",
                              isOutlineButton: false,
                              onBtnClick: () {},
                              colors: colorGreenDark),
                        ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ButtonPrimaryRound(
                        btnName: "Reset Timer",
                        isOutlineButton: false,
                        onBtnClick: () {
                          setState(() {
                            _start = _countdown;
                          });
                        },
                        colors: colorGreen),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ButtonPrimaryRound(
                        btnName: "Refresh Countdown",
                        isOutlineButton: false,
                        onBtnClick: () {
                          getData();
                        },
                        colors: colorGreen),
                  )
                ],
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
