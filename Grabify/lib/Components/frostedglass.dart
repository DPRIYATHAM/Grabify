// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
//import 'dart:ui';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox(
      {super.key, this.theWidth, this.theHeight, this.theChild});

  final theWidth;
  final theHeight;
  final theChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          width: theWidth,
          height: theHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(37, 29, 58, 0.63),
            borderRadius: BorderRadius.circular(20),
          ),
          child: theChild,
        ),
      ),
    );
  }
}
