import 'package:flutter/material.dart';

class homePageCard extends StatelessWidget {
  homePageCard({
    super.key,
    required this.imageURL,
    required this.title,
  });

  String imageURL;
  String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(style: BorderStyle.solid)),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(
            children: <Widget>[
              // Left side: Image
              Container(
                width: 30.0, // Adjust the width as needed
                child: Image.asset(
                  "assets/images/$imageURL.png", // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.0), // Space between image and text
              // Right side: Text
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0, // Font size of 36
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
