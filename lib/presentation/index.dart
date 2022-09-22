// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_menu/presentation/bloc/food_list.dart';
import 'package:food_menu/presentation/router.dart';
import '../data/constants/routes.dart';
import '../data/services/navigation/index.dart';
import '../di/get_it.dart';

class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  late FoodListCubit _foodListCubit;

  @override
  void initState() {
    _foodListCubit = getItInstance<FoodListCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _foodListCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));
    return MultiBlocProvider(
        providers: [BlocProvider.value(value: _foodListCubit)],
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, _) {
              return MaterialApp(
                  theme: ThemeData(
                      primarySwatch: Colors.orange,
                      inputDecorationTheme:
                          const InputDecorationTheme(hintStyle: TextStyle()),
                      primaryColor: Colors.deepOrangeAccent,
                      scaffoldBackgroundColor: Colors.white),
                  navigatorKey:
                      getItInstance<NavigationServiceImpl>().navigationKey,
                  debugShowCheckedModeBanner: false,
                  title: 'Food Menu',
                  initialRoute: Routes.init,
                  onGenerateRoute: (settings) =>
                      CustomRouter.generateRoutes(settings));
            }));
  }
}
