import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// [item_id, item_name, image_link, item_price, item_desc]
List homeShopItems = [];

class Cartmodel extends ChangeNotifier {
  String baseurl = "http://10.0.2.2:8000/api/items/";
  Future<List> getAllItems() async {
    try {
      var response = await http.get(Uri.parse(baseurl));
      if (response.statusCode == 200) {
        homeShopItems = (json.decode(response.body) as List);
        return homeShopItems;
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  //list of items in cart
  var _cartItems = [];

  get shopItems => homeShopItems;

  get cartItems => _cartItems;

  //add item to cart
  void addItemToCart(int index) {
    for (var i in shopItems) {
      if (i['item_id'] == index) {
        _cartItems.add(i);
      }
    }
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //get total price of items in cart
  String getTotalPrice() {
    double totalPrice = 0;
    for (var i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i]['item_price']);
    }
    return totalPrice.toStringAsFixed(1);
  }
}
