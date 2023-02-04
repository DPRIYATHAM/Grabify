import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Components/home_item_tile.dart';
import '../Models/cart_model.dart';

class priceup extends StatefulWidget {
  const priceup({super.key});

  @override
  State<priceup> createState() => _priceup();
}

class _priceup extends State<priceup> {
  Cartmodel AllItems = Cartmodel();
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
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Price Increasing...",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Fredoka',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Expanded(
                                  child: FutureBuilder<List>(
                                    future: AllItems.getpmItems(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return GridView.builder(
                                            itemCount: snapshot.data!.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    childAspectRatio:
                                                        150 / 260),
                                            itemBuilder: (context, index) {
                                              return HomeItemTile(
                                                itemName: snapshot.data![index]
                                                        ['item_name']
                                                    .toString(),
                                                itemImagePath: snapshot
                                                    .data![index]['image_link'],
                                                itemPrice: snapshot.data![index]
                                                        ['item_price']
                                                    .toString(),
                                                itemDescription: snapshot
                                                    .data![index]['item_desc']
                                                    .toString(),
                                                onPressed: () {
                                                  Provider.of<Cartmodel>(
                                                          context,
                                                          listen: false)
                                                      .addItemToCart(
                                                          snapshot.data![index]
                                                              ['item_name']);
                                                  Fluttertoast.showToast(
                                                    msg: 'Item added to cart',
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            224, 77, 1, 1),
                                                    textColor: Colors.white,
                                                    fontSize: 16.0,
                                                  );
                                                },
                                                onPressedLike: () {
                                                  Provider.of<Cartmodel>(
                                                          context,
                                                          listen: false)
                                                      .addLikedItem(
                                                          snapshot.data![index]
                                                              ['item_name']);
                                                  Fluttertoast.showToast(
                                                    msg:
                                                        'Item added to Liked Items',
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            224, 77, 1, 1),
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
                                                color: Colors.white,
                                                fontSize: 30),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                              ]),
                        )
                      ],
                    ))),
          ),
        ));
  }
}
