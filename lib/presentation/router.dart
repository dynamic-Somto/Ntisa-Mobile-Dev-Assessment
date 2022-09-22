import 'package:flutter/cupertino.dart';
import 'package:food_menu/data/model/api/food_list.dart';
import 'package:food_menu/presentation/ui/dashboard.dart';
import 'package:food_menu/presentation/ui/food_details/index.dart';
import 'package:page_transition/page_transition.dart';

import '../data/constants/routes.dart';

class CustomRouter {
  CustomRouter._();
  static generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.init:
        return PageTransition(
            child: const Base(),
            type: PageTransitionType.fade,
            settings: settings);
      case Routes.foodDetails:
        return PageTransition(
            child: FoodDetails(food: settings.arguments as Food),
            type: PageTransitionType.leftToRightJoined,
            childCurrent: const SizedBox(),
            settings: settings);
    }
  }
}
