// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeItemTile extends StatelessWidget {
  final String itemName;
  final String itemImagePath;
  final String itemPrice;
  final String itemDescription;
  void Function()? onPressed;

  HomeItemTile({
    super.key,
    required this.itemName,
    required this.itemImagePath,
    required this.itemPrice,
    required this.itemDescription,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // Item Image
          Container(
            height: 178,
            width: 150,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: CachedNetworkImageProvider(
            //       placeholder: (context, url) => CircularProgressIndicator(),
            //       itemImagePath,
            //     ),
            //     fit: BoxFit.cover,
            //   ),
            // ),
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
          // Item Name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              //   border: Border(
              //     left: BorderSide(color: Colors.white, width: 2),
              //     right: BorderSide(color: Colors.white, width: 2),
              //     bottom: BorderSide(color: Colors.white, width: 2),
              //   ),
              // ),
              width: MediaQuery.of(context).size.width * 0.40,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      // Item Description
                      Text(
                        itemDescription,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  // Item Price
                  Spacer(),
                  Text(
                    "₹$itemPrice",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            child: MaterialButton(
              onPressed: onPressed,
              height: MediaQuery.of(context).size.height * 0.04,
              color: Color.fromRGBO(224, 77, 1, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ],
      ),
    );
  }
}
