import 'package:flutter/material.dart';
import 'package:seb7a_electronya_app/Screen/Widget/floating_action.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Core/colors.dart';
import '../Widget/body.dart';

class Tap3 extends StatefulWidget {
  const Tap3({super.key, required this.title});
  final String? title;
  @override
  State<Tap3> createState() => _Tap3State();
}

class _Tap3State extends State<Tap3> with WidgetsBindingObserver {
  late SharedPreferences _prefs;
  int counter3 = 0;
  int lastScore3 = 0;

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
      counter3 = _prefs.getInt('counter3') ?? 0;
      lastScore3 = _prefs.getInt('lastScore3') ?? 0;
    });
  }

  void _incrementCounter() {
    setState(() {
      counter3++;
      _prefs.setInt(
          'counter3', counter3); // Save counter value to SharedPreferences
    });
  }

  void _resetCounter() {
    setState(() {
      lastScore3 = counter3;
      counter3 = 0;
      _prefs.setInt(
          'counter3', counter3); // Save counter value to SharedPreferences
      _prefs.setInt('lastScore3',
          lastScore3); // Save lastScore value to SharedPreferences
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
    _prefs.setInt('counter3', counter3);
    _prefs.setInt('lastScore3', lastScore3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorVar,
      // floatingActionButtonLocation to define the location of the floating action button
      floatingActionButton: ResetButton(onPressedd: _resetCounter),
      body: GestureDetector(
        // ignore: sized_box_for_whitespace
        onTap: _incrementCounter,
        // ignore: sized_box_for_whitespace
        child: MyBody(counter: counter3, lastScore: lastScore3),
      ),
    );
  }
}
