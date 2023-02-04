// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:grabify/Components/footer.dart';
import 'package:grabify/Components/iconasset.dart';
import 'package:grabify/Models/cart_model.dart';
import 'package:grabify/Screens/cart_page.dart';
import 'package:grabify/Screens/favorite_page.dart';
import 'package:grabify/Screens/nonveg.dart';
import 'package:grabify/Screens/priceless.dart';
import 'package:grabify/Screens/pricemore.dart';
import 'package:grabify/Screens/veg.dart';
import 'package:grabify/Screens/welcome.dart';
import 'package:provider/provider.dart';
import '../Components/home_item_tile.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Cartmodel AllItems = Cartmodel();

  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CartPage(),
          ),
        ),
        backgroundColor: Color.fromRGBO(224, 77, 1, 1),
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      backgroundColor: Color.fromRGBO(42, 37, 80, 1),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              //color: Color.fromRGBO(42, 37, 80, 1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Hello, ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "${userdata.read('name')}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Fluttertoast.showToast(
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    msg: "App is still under works",
                                  );
                                },
                                child: SvgPicture.asset(
                                  searchicon,
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LikedPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Liked',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: MaterialButton(
                                      onPressed: () {
                                        userdata.write('isLoggedIn', false);
                                        userdata.remove('name');
                                        userdata.remove('roll');
                                        userdata.remove('phone');
                                        userdata.remove('password');
                                        Fluttertoast.showToast(
                                            msg: 'Logged Out Successfully',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.black,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        Get.offAll(WelcomePage());
                                      },
                                      child: Text(
                                        'Logout',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                      'assets/images/Grabify_Logo_final.png'),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.07,
                            ),
                            SizedBox(
                              height: 30,
                              child: OutlinedButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const vegpage(),
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 224, 75, 1),
                                      width: 4),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(14.0)),
                                ),
                                child: const Text(
                                  'veg',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            SizedBox(
                              height: 30,
                              child: OutlinedButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const nonvegpage(),
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 224, 75, 1),
                                      width: 4),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(14.0)),
                                ),
                                child: const Text(
                                  'Non veg',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            SizedBox(
                              height: 30,
                              child: OutlinedButton(
                                  onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const priceup(),
                                        ),
                                      ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Color.fromARGB(255, 224, 75, 1),
                                        width: 4),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0)),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Price",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(Icons.arrow_upward,
                                          color: Colors.white)
                                    ],
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            SizedBox(
                              height: 30,
                              child: OutlinedButton(
                                  onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const pricedown(),
                                        ),
                                      ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Color.fromARGB(255, 224, 75, 1),
                                        width: 4),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0)),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Price",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(Icons.arrow_downward,
                                          color: Colors.white)
                                    ],
                                  )),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Expanded(
                          child: FutureBuilder<List>(
                            future: AllItems.getAllItems(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GridView.builder(
                                    itemCount: snapshot.data!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 150 / 260),
                                    itemBuilder: (context, index) {
                                      return HomeItemTile(
                                        itemName: snapshot.data![index]
                                                ['item_name']
                                            .toString(),
                                        itemImagePath: snapshot.data![index]
                                            ['image_link'],
                                        itemPrice: snapshot.data![index]
                                                ['item_price']
                                            .toString(),
                                        itemDescription: snapshot.data![index]
                                                ['item_desc']
                                            .toString(),
                                        onPressed: () {
                                          Provider.of<Cartmodel>(context,
                                                  listen: false)
                                              .addItemToCart(snapshot
                                                  .data![index]['item_name']);
                                          Fluttertoast.showToast(
                                            msg: 'Item added to cart',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                                Color.fromRGBO(224, 77, 1, 1),
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                        },
                                        onPressedLike: () {
                                          Provider.of<Cartmodel>(context,
                                                  listen: false)
                                              .addLikedItem(snapshot
                                                  .data![index]['item_name']);
                                          Fluttertoast.showToast(
                                            msg: 'Item added to Liked Items',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                                Color.fromRGBO(224, 77, 1, 1),
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                        },
                                      );
                                    });
                              } else {
                                return const Center(
                                  child: Text(
                                    'Loading...',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                );
                              }
                            },
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
