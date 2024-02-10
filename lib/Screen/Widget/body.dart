import 'package:flutter/material.dart';

import '../../Core/colors.dart';

class MyBody extends StatelessWidget {
  const MyBody({
    super.key,required this.counter,required this.lastScore
  });

  final int counter;
  final int lastScore;


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: SizedBox(
        // color: const Color.fromARGB(255, 237, 232, 232),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            // text counter of the seb7a
            Text(
              '$counter',
              style: TextStyle(fontSize: 50, color: brown2),
            ),
            Text('اخر تقدم : $lastScore'),
            // icon of the reset
          ],
        ),
      ),
    );
    
  }
  
}
