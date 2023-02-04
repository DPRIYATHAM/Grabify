// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Components/hero_logo.dart';
import '../Components/vectorasset.dart';
import 'sign_up.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SvgPicture.asset(
            wpage,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Logo(),
                SizedBox(
                  height: /*200*/ MediaQuery.of(context).size.height * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(0.8),
                  // button in center with text Let's get started
                  child: ElevatedButton(
                    onPressed: () {
                      //navigate to sign_up.dart
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MySignUp()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 244, 119, 52)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                      elevation: MaterialStateProperty.all<double>(20),
                      overlayColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 100, 3, 114)),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: Center(
                        child: Text(
                          "Let's get started!!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: /*100*/ MediaQuery.of(context).size.height * 0.23),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
