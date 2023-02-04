// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import 'vectorasset.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(
            logo,
            height: 200,
            width: 200,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.045),
        Text("Grabify",
            style: TextStyle(
              color: Colors.white,
              fontSize: 100,
              fontFamily: 'Fredoka',
            )),
      ]),
    );
  }
}
