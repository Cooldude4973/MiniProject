import 'package:flutter/material.dart';
import 'package:mini_1/Data/dimensions.dart';

class longRoundBtn extends StatelessWidget {
  longRoundBtn({
    super.key,
    required this.text,
    required this.width,
    required this.onPressed,
  });

  String text;
  double width;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(25),
        ),
        height: 50,
        width: width,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
