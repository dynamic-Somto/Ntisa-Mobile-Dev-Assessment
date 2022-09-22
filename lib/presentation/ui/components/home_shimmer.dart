import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: FadeShimmer(
            width: double.infinity,
            height: 120.h,
            radius: 20.r,
            baseColor: Colors.white,
            highlightColor: Colors.grey.shade200),
      ),
      SizedBox(height: 20.h),
      SingleChildScrollView(
          padding:
          EdgeInsets.symmetric(horizontal: 10.w),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
                  5,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: FadeShimmer(
                            width: 110.w,
                            height: 110.h,
                            radius: 23.r,
                            baseColor: Colors.white,
                            highlightColor: Colors.grey.shade200),
                      )))),
      SizedBox(height: 20.h),
      Padding(
          padding: EdgeInsets.only(left: 22.w),
          child: Text('Top Products',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600))),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 270.h,
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            itemBuilder: (context, idx) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
              child: FadeShimmer(
                  width: 150.w,
                  height: 220.h,
                  radius: 23.r,
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade200),
            )),
      ),
      SizedBox(height: 200.h)
    ]);
  }
}
