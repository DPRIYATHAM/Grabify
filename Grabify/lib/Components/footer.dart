// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
//import 'package:get_it/get_it.dart';

import '../Screens/cart_page.dart';
import '../Screens/home.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:grabify/Components/iconasset.dart';

class MyFooter extends StatefulWidget {
  const MyFooter({super.key});

  @override
  State<MyFooter> createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: screens[index],
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeInOut,
        height: 75,
        color: Color.fromRGBO(224, 77, 1, 1),
        backgroundColor: Color.fromRGBO(42, 37, 80, 1),
        animationDuration: Duration(milliseconds: 300),
        items: [
          //Icon(Icons.home, size: 30, color: Colors.white),
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyHome()));
              },
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              color: Colors.white,
            ),
          ),
          // SvgPicture.asset(
          //   homeicon,
          //   height: 38,
          //   color: Colors.white,
          // ),
          //Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              color: Colors.white,
            ),
          ),
          // SvgPicture.asset(
          //   carticon,
          //   height: 38,
          //   color: Colors.white,
          // ),
          //Icon(Icons.favorite, size: 30, color: Colors.white),
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyHome()));
              },
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              color: Colors.white,
            ),
          ),
          // SvgPicture.asset(
          //   likicon,
          //   height: 38,
          //   color: Colors.white,
          // ),
          //Icon(Icons.settings, size: 30, color: Colors.white),
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyHome()));
              },
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
              color: Colors.white,
            ),
          ),
          // SvgPicture.asset(
          //   settingicon,
          //   height: 38,
          //   color: Colors.white,
          // ),
        ],
      ),
    );
  }
}
