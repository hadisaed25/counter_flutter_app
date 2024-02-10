import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Core/colors.dart';
import '../Widget/body.dart';
import '../Widget/floating_action.dart';

class Tap4 extends StatefulWidget {
  const Tap4({super.key, required this.title});
  final String? title;
  @override
  State<Tap4> createState() => _Tap4State();
}

class _Tap4State extends State<Tap4> with WidgetsBindingObserver {
  late SharedPreferences _prefs;
  int counter4 = 0;
  int lastScore4 = 0;

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
      counter4 = _prefs.getInt('counter4') ?? 0;
      lastScore4 = _prefs.getInt('lastScore4') ?? 0;
    });
  }

  void _incrementCounter() {
    setState(() {
      counter4++;
      _prefs.setInt(
          'counter4', counter4); // Save counter value to SharedPreferences
    });
  }

  void _resetCounter() {
    setState(() {
      lastScore4 = counter4;
      counter4 = 0;
      _prefs.setInt(
          'counter4', counter4); // Save counter value to SharedPreferences
      _prefs.setInt('lastScore4',
          lastScore4); // Save lastScore value to SharedPreferences
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
    _prefs.setInt('counter4', counter4);
    _prefs.setInt('lastScore4', lastScore4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorVar,
      // floatingActionButtonLocation to define the location of the floating action button
      floatingActionButton: ResetButton(onPressedd: _resetCounter),
      body: GestureDetector(
          onTap: _incrementCounter,
          child: MyBody(counter: counter4, lastScore: lastScore4)),
    );
  }
}
