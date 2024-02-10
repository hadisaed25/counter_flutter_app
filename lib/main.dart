import 'package:flutter/material.dart';

import 'Screen/home.dart';

void main() {
  runApp(const MySbha()); // Root of the App
}

class MySbha extends StatelessWidget {
  const MySbha({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ); //Mange the App
  }
}
