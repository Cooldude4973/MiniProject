import 'package:flutter/material.dart';
import 'package:mini_1/Data/dimensions.dart';

// class historyCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MyCard();
//   }
// }

class MyCard extends StatelessWidget {
  MyCard({
    super.key,
    required this.imageAsset,
    required this.title,
  });

  String imageAsset;
  String title;

  String returnWeekDay(DateTime dateTime) {
    int val = dateTime.weekday;
    if (val == 1) {
      return "Mon";
    } else if (val == 2) {
      return "Tue";
    } else if (val == 3) {
      return "Wed";
    } else if (val == 4) {
      return "Thurs";
    } else if (val == 5) {
      return "Fri";
    } else if (val == 6) {
      return "Sat";
    } else {
      return "Sun";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        color: const Color.fromARGB(131, 187, 222, 251),
        elevation: 4.0, // Adjust the card's elevation as needed
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Image.asset(
                imageAsset,
                width: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
