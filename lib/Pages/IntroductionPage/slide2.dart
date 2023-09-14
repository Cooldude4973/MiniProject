import 'package:flutter/material.dart';

class slide2 extends StatelessWidget {
  const slide2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ClickImage.png',
            height: 100,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Click Image',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontSize: 36,
            ),
          ),
        ],
      ),
    );
  }
}
