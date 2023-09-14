import 'package:flutter/material.dart';

double getDimensionHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getDimensionWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
