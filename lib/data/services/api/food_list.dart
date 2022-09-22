import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_menu/data/model/api/food_list.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

abstract class FoodListService {
  Future<List<Food>> getFoodList();
}

class FoodListServiceImpl extends FoodListService {
  @override
  Future<List<Food>> getFoodList() async {
    try {
      http.Response res = await http.Client().get(
          Uri.parse('https://ig-food-menus.herokuapp.com/burgers'),
          headers: {
            HttpHeaders.acceptHeader: 'application/json',
            'Content-Type': 'application/json; charset=UTF-8'
          }).timeout(const Duration(seconds: 10), onTimeout: () {
        Fluttertoast.showToast(msg: 'Connection Timeout.');
        return Future.delayed(const Duration(seconds: 1));
      });
      if (res.statusCode == 200) {
        return foodListFromMap(res.body);
      } else {
        Fluttertoast.showToast(msg: 'An error occurred.\nTry again.');
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(msg: 'An error occurred.\nTry again.');
      return [];
    }
  }
}
