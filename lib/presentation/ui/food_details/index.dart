import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_menu/data/model/api/food_list.dart';
import 'package:food_menu/data/services/navigation/index.dart';
import 'package:food_menu/di/get_it.dart';
import 'package:food_menu/presentation/ui/components/shadow_card.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  ValueNotifier<bool> like = ValueNotifier(false);
  ValueNotifier<int> count = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Stack(alignment: Alignment.topCenter, children: [
                  Positioned(
                      top: -(MediaQuery.of(context).size.height * 0.3),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.height * 0.7,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade100))),
                  Column(children: [
                    SizedBox(height: 55.h),
                    Row(children: [
                      SizedBox(width: 15.w),
                      IconButton(
                          onPressed: () =>
                              getItInstance<NavigationServiceImpl>().pop(),
                          icon: const Icon(Icons.arrow_back_ios)),
                      const Spacer(),
                      ValueListenableBuilder(
                          valueListenable: like,
                          builder: (context, value, _) {
                            return IconButton(
                                onPressed: () => like.value = !like.value,
                                icon: Icon(
                                    like.value
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: like.value
                                        ? Colors.deepOrangeAccent
                                        : null));
                          }),
                      SizedBox(width: 15.w)
                    ]),
                    SizedBox(height: 5.w),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 35.w),
                            child: Text(widget.food.name,
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w600)))),
                    const Spacer(),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.23,
                        width: MediaQuery.of(context).size.height * 0.23,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.food.img))))
                  ])
                ])),
            SizedBox(height: 40.h),
            Row(children: [
              SizedBox(width: 20.w),
              Expanded(
                  child: Column(children: [
                Text('523 kkal',
                    style: TextStyle(
                        fontSize: 21.sp, fontWeight: FontWeight.w800)),
                SizedBox(height: 15.h),
                Text('Energy',
                    style: TextStyle(
                        fontSize: 18.sp, color: Colors.deepOrangeAccent))
              ])),
              Expanded(
                  child: Column(children: [
                Text('800 gr.',
                    style: TextStyle(
                        fontSize: 21.sp, fontWeight: FontWeight.w800)),
                SizedBox(height: 15.h),
                Text('Weight',
                    style: TextStyle(
                        fontSize: 18.sp, color: Colors.deepOrangeAccent))
              ])),
              Expanded(
                  child: Column(children: [
                Text('80 min',
                    style: TextStyle(
                        fontSize: 21.sp, fontWeight: FontWeight.w800)),
                SizedBox(height: 15.h),
                Text('Delivery',
                    style: TextStyle(
                        fontSize: 18.sp, color: Colors.deepOrangeAccent))
              ])),
              SizedBox(width: 20.w)
            ]),
            SizedBox(height: 50.h),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SizedBox(width: 30.w),
              Column(children: [
                ShadowCard(icon: Icons.add, onTap: () => count.value++),
                SizedBox(height: 10.h),
                ValueListenableBuilder(
                    valueListenable: count,
                    builder: (context, value, _) {
                      return Text(count.value.toString(),
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w700));
                    }),
                SizedBox(height: 10.h),
                ShadowCard(icon: Icons.remove, onTap: () => count.value--)
              ]),
              SizedBox(width: 20.w),
              Expanded(
                  child: Text(widget.food.dsc,
                      style: TextStyle(
                          fontSize: 18.sp, color: Colors.grey.shade700))),
              SizedBox(width: 20.w)
            ]),
            SizedBox(height: 40.h),
            Row(children: [
              SizedBox(width: 20.w),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(18.r)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add, color: Colors.white),
                            SizedBox(width: 5.w),
                            Text('Add to Cart',
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.white))
                          ]))),
              SizedBox(width: 20.w),
              Text('\$' + widget.food.price.toString(),
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.w600)),
              SizedBox(width: 40.w)
            ]),
          ],
        ),
      ),
    );
  }
}
