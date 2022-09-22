import 'package:food_menu/data/services/api/food_list.dart';
import 'package:food_menu/presentation/bloc/food_list.dart';
import 'package:get_it/get_it.dart';
import '../data/services/navigation/index.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<NavigationServiceImpl>(
      () => NavigationServiceImpl());

  //Auth Api
  getItInstance
      .registerLazySingleton<FoodListServiceImpl>(() => FoodListServiceImpl());

  //FoodList Cubit
  getItInstance.registerFactory<FoodListCubit>(
      () => FoodListCubit(foodListServiceImpl: getItInstance()));
}
