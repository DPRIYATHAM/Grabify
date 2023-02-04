// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grabify/Components/iconasset.dart';

class CartItemTile extends StatelessWidget {
  final String itemName;
  final String itemImagePath;
  final String itemPrice;
  final String itemDescription;
  final String itemQuantity;
  void Function()? onPressed;
  void Function()? onPressed1;
  void Function()? onPressed2;

  CartItemTile({
    super.key,
    required this.itemName,
    required this.itemImagePath,
    required this.itemPrice,
    required this.itemDescription,
    required this.itemQuantity,
    required this.onPressed,
    required this.onPressed1,
    required this.onPressed2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 100,
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(224, 77, 1, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          // List like representation of the item
          child: Row(
            children: <Widget>[
              // Item Image
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: itemImagePath,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(224, 77, 1, 1),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              // Item Details
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    // Item Name
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        itemName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Item Price
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        "₹ $itemPrice",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              // Item Quantity with increment and decrement buttons
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Increment Button
                    SizedBox(
                      child: GestureDetector(
                        onTap: onPressed,
                        child: SvgPicture.asset(
                          increment,
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Item Quantity
                    Container(
                      height: 20,
                      child: Text(
                        itemQuantity,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Use Decrement.png as button
                    SizedBox(
                      child: GestureDetector(
                        onTap: onPressed1,
                        child: SvgPicture.asset(
                          decrement,
                          height: 28,
                          width: 28,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Delete Button
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.1,
                child: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.white,
                  onPressed: onPressed2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// child: Row(children: <Widget>[
      //   // Item Image
      //   Container(
      //     height: 100,
      //     width: MediaQuery.of(context).size.width * 0.2,
      //     child: CachedNetworkImage(
      //       imageUrl: itemImagePath,
      //       imageBuilder: (context, imageProvider) => Container(
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //             image: imageProvider,
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),
      //       placeholder: (context, url) => Container(
      //         height: 50,
      //         width: 50,
      //         child: Center(
      //           child: CircularProgressIndicator(
      //             color: Color.fromRGBO(224, 77, 1, 1),
      //           ),
      //         ),
      //       ),
      //       errorWidget: (context, url, error) => Icon(Icons.error),
      //     ),
      //   ),
      //   // Item Details
      //   Container(
      //     height: 100,
      //     width: MediaQuery.of(context).size.width * 0.3,
      //     child: Column(
      //       children: <Widget>[
      //         // Item Name
      //         Container(
      //           height: 50,
      //           width: MediaQuery.of(context).size.width * 0.3,
      //           child: Text(
      //             "$itemName $itemDescription",
      //             style: TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: 30),
      //         // Item Price
      //         Container(
      //           height: 50,
      //           width: MediaQuery.of(context).size.width * 0.3,
      //           child: Text(
      //             itemPrice,
      //             style: TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      //   // Item Quantity with increment and decrement buttons
      //   Container(
      //     height: 100,
      //     width: MediaQuery.of(context).size.width * 0.3,
      //     child: Row(
      //       children: <Widget>[
      //         // Decrement Button
      //         // Container(
      //         //   height: 50,
      //         //   width: 50,
      //         //   child: ElevatedButton(
      //         //     onPressed: onPressed1,
      //         //     child: Icon(Icons.remove),
      //         //   ),
      //         // ),
      //         SizedBox(width: 10),
      //         // Item Quantity
      //         Container(
      //           height: 50,
      //           width: 50,
      //           child: Text(
      //             itemQuantity,
      //             style: TextStyle(
      //               fontSize: 18,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //         SizedBox(width: 10),
      //         // Increment Button
      //         Container(
      //           height: 50,
      //           width: 50,
      //           child: ElevatedButton(
      //             onPressed: onPressed,
      //             child: Icon(Icons.add),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ]),