import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/constants/routes.dart';
import '../../../data/model/api/food_list.dart';
import '../../../data/services/navigation/index.dart';
import '../../../di/get_it.dart';

class FoodListComp extends StatelessWidget {
  final List<Food> foodList;
  const FoodListComp({Key? key, required this.foodList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 250.h,
        child: ListView.builder(
            itemCount: foodList.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, idx) => GestureDetector(
                onTap: () => getItInstance<NavigationServiceImpl>()
                    .navigateTo(Routes.foodDetails, arguments: foodList[idx]),
                child: Container(
                    width: 150.w,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(23.r)),
                    child: Column(children: [
                      Container(
                        height: 130.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.r),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(foodList[idx].img)))),
                      const Spacer(),
                      Row(children: [
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(foodList[idx].name,
                                  style: TextStyle(fontSize: 16.sp)),
                              SizedBox(height: 3.h),
                              Text('\$' + foodList[idx].price.toString(),
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.deepOrangeAccent))
                            ])),
                        CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 20.r,
                            child: const Center(
                                child: Icon(Icons.add, color: Colors.white)))
                      ])
                    ])))));
  }
}
