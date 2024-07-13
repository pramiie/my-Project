// ignore_for_file: must_be_immutable

import 'package:chat_app/ui/utils/themes/theme.dart';
import 'package:flutter/material.dart';

class TexField extends StatelessWidget {
  TexField({super.key, this.controller,this.sufixIcon,this.hintText,this.validator});
  final TextEditingController? controller;
  final String? hintText;
  final Widget? sufixIcon;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 45.w,

      child: Column(
        children: [
          TextFormField(
            textAlign: TextAlign.start,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator:validator,
            controller:controller,
            decoration: InputDecoration(

              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(30)
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(30)
              ),
              enabledBorder:  OutlineInputBorder(
                  borderRadius:BorderRadius.circular(30)
              ) ,
              focusedBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(30)
              ) ,
              focusedErrorBorder:  OutlineInputBorder(
                  borderRadius:BorderRadius.circular(30)
              ) ,
              disabledBorder:  OutlineInputBorder(
                  borderRadius:BorderRadius.circular(30)
              ) ,

              suffixIcon: sufixIcon ?? Icon(Icons.person_2_outlined),
              hintText: hintText??"eneszenler",

            ),
          ),
          SizedBox(height: 20.h),
          Divider(height: 2.h,color: Color(0xFFEFA985),thickness: 1.sp,)
        ],
      ),

    );
  }
}
