import 'package:flutter/material.dart';
import 'package:seb7a_electronya_app/Core/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/body.dart';
import '../Widget/floating_action.dart';

class Tap1 extends StatefulWidget {
  const Tap1({super.key, required this.title});
  final String? title;
  @override
  State<Tap1> createState() => _Tap1State();
}

int counter1 = 0;
int lastScore1 = 0;

class _Tap1State extends State<Tap1> with WidgetsBindingObserver {
  late SharedPreferences _prefs;
  int counter1 = 0;
  int lastScore1 = 0;

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
      counter1 = _prefs.getInt('counter1') ?? 0;
      lastScore1 = _prefs.getInt('lastScore1') ?? 0;
    });
  }

  void _incrementCounter() {
    setState(() {
      counter1++;
      _prefs.setInt(
          'counter1', counter1); // Save counter value to SharedPreferences
    });
  }

  void _resetCounter() {
    setState(() {
      lastScore1 = counter1;
      counter1 = 0;
      _prefs.setInt(
          'counter1', counter1); // Save counter value to SharedPreferences
      _prefs.setInt('lastScore1',
          lastScore1); // Save lastScore value to SharedPreferences
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
    _prefs.setInt('counter1', counter1);
    _prefs.setInt('lastScore1', lastScore1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorVar,
      // floatingActionButtonLocation to define the location of the floating action button
      floatingActionButton: ResetButton(
        onPressedd: _resetCounter,
      ),
      body: GestureDetector(
        // ignore: sized_box_for_whitespace
        onTap: _incrementCounter,
        // ignore: sized_box_for_whitespace
        child: MyBody(
          counter: counter1,
          lastScore: lastScore1,
        ),
      ),
    );
  }
}
