import 'dart:io';

import 'package:flutter/material.dart';

class Attendance {
  Attendance({
    required this.className,
    required this.subjet,
    required this.count,
    required this.imageURL,
    required this.dateTime,
  });
  String subjet;
  String className;
  int count;
  Image imageURL;
  String dateTime;
}
