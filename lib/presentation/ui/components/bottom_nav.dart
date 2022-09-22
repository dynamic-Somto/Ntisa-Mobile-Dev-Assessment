import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int index;
  @override
  void initState() {
    index=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomNavItem(
            color: index ==0? Colors.deepOrangeAccent: Colors.grey,
            icon: Icons.home,
            onTap: ()=> setState(()=> index = 0)
          ),
          BottomNavItem(
            color: index ==1? Colors.deepOrangeAccent: Colors.grey,
            icon: Icons.food_bank_outlined,
            onTap: ()=> setState(()=> index = 1)
          ),
          BottomNavItem(
            color: index ==2? Colors.deepOrangeAccent: Colors.grey,
            icon: Icons.favorite_outline,
            onTap: ()=> setState(()=> index = 2)
          ),
          BottomNavItem(
            color: index ==3? Colors.deepOrangeAccent: Colors.grey,
            icon: Icons.history,
            onTap: ()=> setState(()=> index = 3)
          )
        ]
      )
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final Color color;

  const BottomNavItem(
      {Key? key, this.onTap, required this.color, required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
            onPressed: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
                height: Platform.isIOS ? 70.h : 50.h,
                width: double.infinity,
                color: Colors.transparent,
                child: Icon(icon, color: color, size: 25.h))));
  }
}
