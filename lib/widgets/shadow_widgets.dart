import 'package:flutter/material.dart';

class AppShadows {
  // the shadows for the big cards its a list of shadows
  static const List<BoxShadow> bigCardShadows = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 6,
      offset: Offset(0, 2),
      spreadRadius: 2,
    ),
    BoxShadow(
      color: Color(0x4C000000),
      blurRadius: 2,
      offset: Offset(0, 1),
      spreadRadius: 0,
    )
  ];
  // the shadows for the small cards its a list of shadows
  static const List<BoxShadow> smallCardShadows = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 3,
      offset: Offset(0, 1),
      spreadRadius: 1,
    ),
    BoxShadow(
      color: Color(0x4C000000),
      blurRadius: 2,
      offset: Offset(0, 1),
      spreadRadius: 0,
    )
  ];
}
