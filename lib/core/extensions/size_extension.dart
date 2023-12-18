import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double heightMultiplier(double value) => mediaQuery.size.height * value;
  double widthMultiplier(double value) => mediaQuery.size.width * value;
  double heightSplit(double value) => mediaQuery.size.height / value;
  double widthSplit(double value) => mediaQuery.size.width / value;
  double heightExtraction(double value) => mediaQuery.size.height - value;
  double widthExtraction(double value) => mediaQuery.size.width - value;
}
