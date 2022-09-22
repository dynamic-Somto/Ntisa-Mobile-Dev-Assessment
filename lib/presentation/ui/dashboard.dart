import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_menu/data/constants/assets.dart';
import 'package:food_menu/presentation/bloc/food_list.dart';
import 'package:food_menu/presentation/ui/components/bottom_nav.dart';
import 'package:food_menu/presentation/ui/components/food_list.dart';
import 'package:food_menu/presentation/ui/components/home_shimmer.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  void initState() {
    context.read<FoodListCubit>().getFoodList();
    super.initState();
  }

  List<String> assets = [
    Assets.burger,
    Assets.pizza,
    Assets.drinks,
    Assets.cake,
    Assets.iceCream
  ];

  List<String> names = ['Burger', 'Pizza', 'Drinks', 'Cake', 'Ice cream'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavigation(),
        body: RefreshIndicator(
          onRefresh: () async => context.read<FoodListCubit>().getFoodList(),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                SizedBox(height: 70.h),
                Row(children: [
                  SizedBox(width: 22.w),
                  Text('Hi ', style: TextStyle(fontSize: 18.sp)),
                  Text('Vadim!',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w600)),
                  SizedBox(width: 22.w)
                ]),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                    child: TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: 'Find what you want...',
                            hintStyle: TextStyle(color: Colors.grey.shade700),
                            prefixIcon:
                                Icon(Icons.search, color: Colors.grey.shade700),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18.h, horizontal: 16.w),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.r),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.r),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.r),
                                borderSide: const BorderSide(
                                    color: Colors.transparent))))),
                BlocBuilder<FoodListCubit, FoodListState>(
                    builder: (context, state) {
                  return state.isLoading
                      ? const HomeShimmer()
                      : state.foodList.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 40.h),
                              child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  child: Center(
                                      child: Text('No food\nList',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 25.sp,
                                              fontWeight: FontWeight.w700)))))
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 18.w, vertical: 18.h),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Row(children: [
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              Text(state.foodList.last.name,
                                                  style: TextStyle(
                                                      fontSize: 18.sp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(height: 15.h),
                                              Text(state.foodList.last.dsc,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.white))
                                            ])),
                                        SizedBox(width: 20.w),
                                        Container(
                                            height: 90.h,
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                                image: DecorationImage(
                                                    image: NetworkImage(state
                                                        .foodList.last.img))))
                                      ])),
                                  SizedBox(height: 20.h),
                                  SingleChildScrollView(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                          children: List.generate(
                                              assets.length,
                                              (index) => Container(
                                                    width: 100.w,
                                                    height: 100.w,
                                                    padding:
                                                        EdgeInsets.all(10.w),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.w),
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade100,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    23.r)),
                                                    child: Column(
                                                      children: [
                                                        SvgPicture.asset(
                                                            assets[index],
                                                            color: Colors
                                                                .deepOrangeAccent),
                                                        Text(names[index],
                                                            style: TextStyle(
                                                                fontSize:
                                                                    15.sp))
                                                      ],
                                                    ),
                                                  )))),
                                  SizedBox(height: 20.h),
                                  Padding(
                                      padding: EdgeInsets.only(left: 22.w),
                                      child: Text('Top Products',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600))),
                                  SizedBox(height: 10.h),
                                  FoodListComp(foodList: state.foodList)
                                ]);
                }),
                SizedBox(height: 200.h)
              ])),
        ));
  }
}
