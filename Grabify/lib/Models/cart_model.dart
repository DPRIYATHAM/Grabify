import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// [item_id, item_name, image_link, item_price, item_desc]
List homeShopItems = [];
List homeVegItems = [];
List homeNonVegItems = [];
List homePriceLowItems = [];
List homePriceHighItems = [];

class Cartmodel extends ChangeNotifier {
  String allurl = "http://10.0.2.2:8000/api/items/";
  Future<List> getAllItems() async {
    try {
      var response = await http.get(Uri.parse(allurl));
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

  String vegurl = "http://10.0.2.2:8000/api/items/veg";
  Future<List> getVegItems() async {
    try {
      var response = await http.get(Uri.parse(vegurl));
      if (response.statusCode == 200) {
        homeVegItems = (json.decode(response.body) as List);
        return homeVegItems;
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  String nonvegurl = "http://10.0.2.2:8000/api/items/nonveg";
  Future<List> getNonVegItems() async {
    try {
      var response = await http.get(Uri.parse(nonvegurl));
      if (response.statusCode == 200) {
        homeNonVegItems = (json.decode(response.body) as List);
        return homeNonVegItems;
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  String pricelowurl =
      "http://10.0.2.2:8000/api/items/asc/"; //price low to high
  Future<List> getplItems() async {
    try {
      var response = await http.get(Uri.parse(pricelowurl));
      if (response.statusCode == 200) {
        homePriceLowItems = (json.decode(response.body) as List);
        return homePriceLowItems;
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  String pricehighurl =
      "http://10.0.2.2:8000/api/items/desc/"; //price low to high
  Future<List> getpmItems() async {
    try {
      var response = await http.get(Uri.parse(pricelowurl));
      if (response.statusCode == 200) {
        homePriceHighItems = (json.decode(response.body) as List);
        return homePriceHighItems;
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  //list of items in cart
  var _cartItems = [];

  var _likedItems = [];

  get shopItems => homeShopItems;

  get cartItems => _cartItems;

  get likedItems => _likedItems;

  //add item to cart
  void addItemToCart(String index) {
    bool isPresent = false;
    for (var i in _cartItems) {
      if (i['item_name'] == index) {
        isPresent = true;
        i['item_count'] = (int.parse(i['item_count']) + 1).toString();
      }
    }

    for (var i in shopItems) {
      if (!isPresent && i['item_name'] == index) {
        i['item_count'] = '1';
        _cartItems.add(i);
      }
    }
    notifyListeners();
  }

  //single item remove from cart
  void removeSingleItemFromCart(int index) {
    if (_cartItems[index]['item_count'] == "1") {
      _cartItems.removeAt(index);
    } else {
      _cartItems[index]['item_count'] =
          (int.parse(_cartItems[index]['item_count']) - 1).toString();
    }
    notifyListeners();
  }

  // add single item inside cart
  void addSingleItemToCart(int index) {
    _cartItems[index]['item_count'] =
        (int.parse(_cartItems[index]['item_count']) + 1).toString();
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //liked item list only add item to liked list if it is not already in liked list
  void addLikedItem(String index) {
    bool isPresent = false;
    for (var i in _likedItems) {
      if (i['item_name'] == index) {
        isPresent = true;
      }
    }

    for (var i in shopItems) {
      if (!isPresent && i['item_name'] == index) {
        _likedItems.add(i);
      }
    }
    notifyListeners();
  }

  //get total price of items in cart
  String getTotalPrice() {
    int total = 0;
    for (var i = 0; i < _cartItems.length; i++) {
      total += int.parse(_cartItems[i]['item_price']) *
          int.parse(_cartItems[i]['item_count']);
    }
    return total.toString();
  }

  //add to cart from liked item page
  void addLikedItemToCart(int index) {
    bool isPresent = false;
    for (var i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i]['item_name'] == _likedItems[index]['item_name']) {
        isPresent = true;
        _cartItems[i]['item_count'] =
            (int.parse(_cartItems[i]['item_count']) + 1).toString();
      }
    }
    if (!isPresent) {
      _likedItems[index]['item_count'] = "1";
      _cartItems.add(_likedItems[index]);
    }
    notifyListeners();
  }

  // remove item from liked list
  void removeLikedItem(int index) {
    _likedItems.removeAt(index);
    notifyListeners();
  }
}
