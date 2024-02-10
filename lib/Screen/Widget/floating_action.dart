import 'package:flutter/material.dart';

import '../../Core/colors.dart';

class ResetButton extends StatefulWidget {
  final Function()? onPressedd;
  const ResetButton({
    super.key,
// add comma to format the code
    required this.onPressedd,
  });

  @override
  State<ResetButton> createState() => _ResetButtonState();
}

@override
class _ResetButtonState extends State<ResetButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
          backgroundColor: gray,
          onPressed: widget.onPressedd,
          child: const Icon(Icons.restart_alt)),
    );
  }
}
