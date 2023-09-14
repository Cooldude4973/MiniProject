import 'package:flutter/material.dart';

class slide1 extends StatelessWidget {
  const slide1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/VerifyUser.png',
            height: 100,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Verify',
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
