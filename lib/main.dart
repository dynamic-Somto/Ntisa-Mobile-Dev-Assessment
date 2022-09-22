import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_menu/presentation/index.dart';
import 'di/get_it.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    runApp(Index());
  });
}
