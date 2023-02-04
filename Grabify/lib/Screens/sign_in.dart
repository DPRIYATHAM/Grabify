// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grabify/Screens/sign_up.dart';
import '../Components/frostedglass.dart';
import '../Components/hero_logo.dart';
import '../Components/vectorasset.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            signup,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            width: MediaQuery.of(context)
                .size
                .width, // height:  MediaQuery.of(context).size.width,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                SizedBox(
                    height: 175,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Logo(),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.19),
                FrostedGlassBox(
                  theWidth: MediaQuery.of(context).size.width * 0.85,
                  theHeight: MediaQuery.of(context).size.height * 0.4,
                  theChild: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 8, bottom: 8),
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                fillColor: Color.fromRGBO(216, 103, 4, 0.8),
                                filled: true,
                                focusColor: Color.fromARGB(204, 221, 167, 120),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: "RollNo"),
                          ),
                        )),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                            top: 8,
                            bottom: 8,
                          ),
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: Color.fromRGBO(216, 103, 4, 0.8),
                              filled: true,
                              focusColor: Color.fromARGB(204, 221, 167, 120),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              hintStyle: TextStyle(color: Colors.white),
                              hintText: "Phone Number",
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 3, right: 132),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 224, 75, 1),
                                        fontSize: 15),
                                    text: ("Forget password"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 1, top: 14),
                            child: Column(
                                //crossAxisAlignment:CrossAxisAlignment.end,
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 224, 75, 1),
                                      padding: const EdgeInsets.only(
                                          left: 50,
                                          right: 50,
                                          top: 14,
                                          bottom: 15),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14.0)),
                                    ),
                                    child: const Text('Sign in'),
                                  ),
                                ]),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 36.0,
                              right: 30.0,
                              top: 13,
                              bottom: 15.0,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                      text: 'Donot have an account?  '),
                                  TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 224, 75, 1),
                                      fontSize: 15,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MySignUp()));
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
