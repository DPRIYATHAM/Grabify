// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grabify/Screens/home.dart';
import 'package:grabify/Screens/sign_in.dart';
import 'package:get_storage/get_storage.dart';
import '../Components/frostedglass.dart';
import '../Components/hero_logo.dart';
import '../Components/vectorasset.dart';

class MyPssd extends StatefulWidget {
  final String name;
  final String roll;
  final String phone;
  const MyPssd(
      {Key? key, required this.name, required this.roll, required this.phone})
      : super(key: key);

  @override
  State<MyPssd> createState() => _MyPssdState();
}

class _MyPssdState extends State<MyPssd> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: <Widget>[
                  SvgPicture.asset(
                    pssdpage,
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
                          theHeight: MediaQuery.of(context).size.height * 0.45,
                          theChild: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
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
                                        controller: _password,
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
                                          hintText: 'Password',
                                        ),
                                        obscureText: true,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter a password';
                                          }
                                          if (value.length < 8) {
                                            return 'Password must be atleast 8 charecters';
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
                                        controller: _confirmPassword,
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
                                          hintText: 'Confirm Password',
                                        ),
                                        obscureText: true,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please re-enter the password';
                                          }
                                          if (_password.text !=
                                              _confirmPassword.text) {
                                            return 'Password does not match';
                                          }
                                          return null;
                                        },
                                      ),
                                      // ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // if (_formKey.currentState.validate()) {
                                        //   Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) =>
                                        //               MySignUp()));
                                        // }

                                        //if the form is valid then go to the next page
                                        if (_formKey.currentState!.validate()) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyHome()));
                                          userdata.write('isLoggedIn', true);
                                          print(userdata.read('isLoggedIn'));
                                          userdata.write('password',
                                              _password.text.toString());
                                          userdata.write('name', widget.name);
                                          userdata.write('rollno', widget.roll);
                                          userdata.write(
                                              'phonenumber', widget.phone);
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
                                                Navigator.push(
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
