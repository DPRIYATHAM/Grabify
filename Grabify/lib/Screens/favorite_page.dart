// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grabify/Models/cart_model.dart';
import 'package:provider/provider.dart';

import '../Components/like_item_tile copy.dart';

class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Color.fromRGBO(42, 37, 80, 1),
      body: Consumer<Cartmodel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Liked Items",
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Consumer<Cartmodel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      itemCount: value.likedItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 150 / 260),
                      itemBuilder: (context, index) {
                        return LikedItemTile(
                          itemName:
                              value.likedItems[index]['item_name'].toString(),
                          itemImagePath: value.likedItems[index]['image_link'],
                          itemPrice:
                              value.likedItems[index]['item_price'].toString(),
                          itemDescription:
                              value.likedItems[index]['item_desc'].toString(),
                          onPressed: () {
                            Provider.of<Cartmodel>(context, listen: false)
                                .addLikedItemToCart(index);
                            Fluttertoast.showToast(
                              msg: 'Item added to cart',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color.fromRGBO(224, 77, 1, 1),
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          },
                          //function for remove liked item from liked items list
                          onPressedLiked1: () {
                            Provider.of<Cartmodel>(context, listen: false)
                                .removeLikedItem(index);
                            Fluttertoast.showToast(
                              msg: 'Item removed from Liked Items',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color.fromRGBO(224, 77, 1, 1),
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
