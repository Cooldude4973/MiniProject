import 'package:flutter/material.dart';

class slide3 extends StatelessWidget {
  const slide3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ImageProcessing.png',
            color: Colors.blue,
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Processing Image',
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
