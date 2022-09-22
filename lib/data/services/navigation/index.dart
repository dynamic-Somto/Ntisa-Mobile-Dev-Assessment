import 'package:flutter/material.dart';

abstract class NavigationService {
  Future<dynamic> navigateTo(String routeName, {dynamic arguments});
  Future<dynamic> replaceWith(String routeName, {dynamic arguments});
  void pop({dynamic v});
  void popUntil(String routeName);
  void popApp({dynamic v});
  Future<dynamic> replaceUntil(
      {required String routeName,
        required String lastRouteName,
        dynamic arguments});
}

class NavigationServiceImpl extends NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _materialAppNavigatorKey =
  GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;
  GlobalKey<NavigatorState> get materialAppNavigatorKey =>
      _materialAppNavigatorKey;
  @override
  Future<bool> pop({dynamic v = false}) {
    return _navigationKey.currentState!.maybePop(v);
  }

  @override
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> replaceWith(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  Future replaceUntil(
      {required String routeName,
        required String lastRouteName,
        dynamic arguments}) {
    return _navigationKey.currentState!.pushNamedAndRemoveUntil(
        lastRouteName, ModalRoute.withName(routeName),
        arguments: arguments);
  }

  @override
  void popApp({dynamic v = false}) {
    return _materialAppNavigatorKey.currentState!.pop(v);
  }

  @override
  void popUntil(String routeName) {
    return _navigationKey.currentState!
        .popUntil(ModalRoute.withName(routeName));
  }
}