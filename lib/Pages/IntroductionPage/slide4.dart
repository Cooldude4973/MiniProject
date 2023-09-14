import 'package:flutter/material.dart';

class slide4 extends StatelessWidget {
  const slide4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Storage.png',
            color: Colors.blue,
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'View Old Records Anytime',
            textAlign: TextAlign.center,
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
