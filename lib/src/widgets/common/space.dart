import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing(
    this.value, {
    Key? key,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing(
    this.value, {
    Key? key,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value,
    );
  }
}

// double get screenWidth {
//   return MediaQuery.of(.context!).size.width;
// }

// double get screenHeight {
//   return MediaQuery.of(Get.context!).size.height;
// }

// bool get isWide => screenHeight < screenWidth;

//Calculate equivalent of size in design to size in screen height
double eqH(double inDesign, double screenHeight) => (inDesign / 812) * screenHeight;

//Calculate equivalent of size in design to size in screen Width
double eqW(double inDesign,double screenWidth) => (inDesign / 375) * screenWidth;

EdgeInsetsGeometry pad({
  double horiz = 0,
  double vert = 0,
  double? both,
  required screenWidth,
  required screenHeight,
}) =>
    EdgeInsets.symmetric(
      horizontal: eqW(both ?? horiz, screenWidth),
      vertical: eqH(both ?? vert, screenHeight),
    );

width(BuildContext context) => MediaQuery.of(context).size.width;
