import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
   CommonButton({super.key, this.child,this.onTap});
  Widget? child;
   void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child:child ?? Text("Sign In",style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w400,color: Colors.white))),
        width: 100.w,
        height: 50.h,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          color: Color(0xFFEFA985)
         ),
      ),
    );
  }
}
