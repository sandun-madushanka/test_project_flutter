import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testflutter/providers/countdown_provider.dart';
import 'package:testflutter/screens/home/counter/counter_screen.dart';

import '../../ui_helpers/colors.dart';
import '../widgets/button_primary_rect.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _countdown;

  @override
  void initState() {
    _countdown = 0;
    getData();
    super.initState();
  }

  getData() async {
    _countdown = await Provider.of<CountdownProvider>(context, listen: false)
        .getCountdownValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
