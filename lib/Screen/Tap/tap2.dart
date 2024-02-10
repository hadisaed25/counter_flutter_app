import 'package:flutter/material.dart';
import 'package:seb7a_electronya_app/Screen/Widget/floating_action.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Core/colors.dart';
import '../Widget/body.dart';

class Tap2 extends StatefulWidget {
  const Tap2({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _Tap2State createState() => _Tap2State();
}

class _Tap2State extends State<Tap2> with WidgetsBindingObserver {
  late SharedPreferences _prefs;
  int counter2 = 0;
  int lastScore2 = 0;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      counter2 = _prefs.getInt('counter2') ?? 0;
      lastScore2 = _prefs.getInt('lastScore2') ?? 0;
    });
  }

  void _incrementCounter() {
    setState(() {
      counter2++;
      _prefs.setInt(
          'counter2', counter2); // Save counter value to SharedPreferences
    });
  }

  void _resetCounter() {
    setState(() {
      lastScore2 = counter2;
      counter2 = 0;
      _prefs.setInt(
          'counter2', counter2); // Save counter value to SharedPreferences
      _prefs.setInt('lastScore2',
          lastScore2); // Save lastScore value to SharedPreferences
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _saveSharedPreferences();
    }
  }

  void _saveSharedPreferences() {
    _prefs.setInt('counter2', counter2);
    _prefs.setInt('lastScore2', lastScore2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorVar,
      floatingActionButton: ResetButton(onPressedd: _resetCounter

          // to add arguments you should put the fuction in fuction lamda,
          ),
      body: GestureDetector(
        onTap: _incrementCounter,
        child: MyBody(counter: counter2, lastScore: lastScore2),
      ),
    );
  }
}
