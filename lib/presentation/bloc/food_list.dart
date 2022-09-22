import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_menu/data/model/api/food_list.dart';
import 'package:food_menu/data/services/api/food_list.dart';

class FoodListState{
  bool isLoading;
  List<Food> foodList;
  FoodListState({required this.isLoading, required this.foodList});
}

class FoodListCubit extends Cubit<FoodListState>{
  FoodListServiceImpl foodListServiceImpl;
  FoodListCubit({required this.foodListServiceImpl}) : super(FoodListState(isLoading: false, foodList: []));

  void setLoading(bool v){
    emit(FoodListState(isLoading: v, foodList: state.foodList));
  }

  void getFoodList() async{
    setLoading(true);
    List<Food> foodList = await foodListServiceImpl.getFoodList();
    setLoading(false);
    emit(FoodListState(isLoading: state.isLoading, foodList: foodList));
  }
}