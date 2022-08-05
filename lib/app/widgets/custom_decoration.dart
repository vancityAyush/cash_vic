import 'package:flutter/material.dart';

BoxDecoration decorationbox({color}) {
  return BoxDecoration(
    color: color == null ? Colors.white : color,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 0.2,
        blurRadius: 2,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  );
}
