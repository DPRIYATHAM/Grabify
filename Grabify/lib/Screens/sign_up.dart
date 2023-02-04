// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grabify/Components/frostedglass.dart';
import 'package:grabify/Screens/password_page.dart';
import 'package:grabify/Screens/sign_in.dart';
import '../Components/hero_logo.dart';
import '../Components/vectorasset.dart';

class MySignUp extends StatefulWidget {
  const MySignUp({super.key});

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _roll = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    signup,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07),
                        // Container(
                        //     height: MediaQuery.of(context).size.height * 0.4,
                        //     width: MediaQuery.of(context).size.width * 0.4,
                        //     child: SizedBox(
                        //         height: 300,
                        //         width: 200,
                        //         child:
                        //             FittedBox(fit: BoxFit.scaleDown, child: Logo()))),
                        // Transform.scale(
                        //   scale: 0.5,
                        //   child: Logo(),
                        // )
                        SizedBox(
                            height: 175,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Logo(),
                            )),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.12),
                        //Take inputs of name and roll number and phonenumber
                        FrostedGlassBox(
                          theWidth: MediaQuery.of(context).size.width * 0.85,
                          theHeight: MediaQuery.of(context).size.height * 0.50,
                          theChild: Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 30.0,
                                      right: 30.0,
                                      top: 8.0,
                                      bottom: 5.0,
                                    ),
                                    child: Container(
                                      child: TextFormField(
                                        controller: _name,
                                        style: TextStyle(color: Colors.white),
                                        textDirection: TextDirection.ltr,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          fillColor:
                                              Color.fromRGBO(216, 103, 4, 0.8),
                                          filled: true,
                                          focusColor: Color.fromARGB(
                                              204, 221, 167, 120),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          hintText: 'Name',
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter a Name';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 30.0,
                                      right: 30.0,
                                      top: 5.0,
                                      bottom: 5.0,
                                    ),
                                    child: Container(
                                      child: TextFormField(
                                        controller: _roll,
                                        style: TextStyle(color: Colors.white),
                                        textDirection: TextDirection.ltr,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          fillColor:
                                              Color.fromRGBO(216, 103, 4, 0.8),
                                          filled: true,
                                          focusColor: Color.fromARGB(
                                              204, 221, 167, 120),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          hintText: 'Roll Number',
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter a Roll Number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 30.0,
                                      right: 30.0,
                                      top: 5.0,
                                      bottom: 5.0,
                                    ),
                                    child: Container(
                                      child: TextFormField(
                                        controller: _phone,
                                        style: TextStyle(color: Colors.white),
                                        textDirection: TextDirection.ltr,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          fillColor:
                                              Color.fromRGBO(216, 103, 4, 0.8),
                                          filled: true,
                                          focusColor: Color.fromARGB(
                                              204, 221, 167, 120),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            borderSide: BorderSide(
                                                color: Colors.transparent),
                                          ),
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          hintText: 'Phone Number',
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter a Phone Number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        //use validator to check if the fields are empty
                                        if (_formKey.currentState!.validate()) {
                                          //if not empty then navigate to the next page
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MyPssd(
                                                name: _name.text,
                                                roll: _roll.text,
                                                phone: _phone.text,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color.fromARGB(
                                                    255, 224, 75, 1)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        )),
                                        elevation:
                                            MaterialStateProperty.all<double>(
                                                20),
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 100, 3, 114)),
                                      ),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.28,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.055,
                                        child: Center(
                                          child: Text(
                                            "Continue",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 30.0,
                                      right: 30.0,
                                      top: 5.0,
                                      bottom: 10.0,
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                              text:
                                                  'Already have an account?  '),
                                          TextSpan(
                                            text: 'Sign In',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 224, 75, 1),
                                              fontSize: 15,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignIn()),
                                                );
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
