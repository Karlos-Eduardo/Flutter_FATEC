//ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

logo(double widget, double height, {double borda = 20}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: widget,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 53, 66, 68),
              offset: Offset(2, 4), //x depois y
            )
          ],
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(borda),
            child: Image.asset('lib/images/logo.png')),
      ),
    ],
  );
}
