import 'package:chat_app/ui/utils/Common_widget/listView.dart';
import 'package:chat_app/ui/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _homeState();
}

class _homeState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xFF4D426D),
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
        
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 49.h,),
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37.0),
                  child: Text("Settings",style: TextStyle(fontSize:24.sp,fontWeight: FontWeight.w800,color: Colors.white)),
                ),
                SizedBox(height: 7.h,),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width:  MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFF6D5F9A),
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(40.r),topRight:Radius.circular(40.r),),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 78.h,),
                    CircleAvatar(
                    radius: 60,
                      backgroundImage: AssetImage('assets/profile_pic.jpg'),

                    ),
                        Text("Username",style: TextStyle(fontSize:20.sp,fontWeight: FontWeight.w700,color: Colors.white)),
                        Text("Online",style: TextStyle(fontSize:15.sp,fontWeight: FontWeight.w300,color: Colors.white)),
                        Expanded(child: ListView1(data: lists,)),

                      ],
                    ),
                  ),
                ),


              ]  ),
        )
    );
  }
  List<Map<String,dynamic>> lists=[
    {
      "title":"parth",
      "sub":"hello im parth",
      "day":"today"
    },
    {
      "title":"goku",
      "sub":"hello im goku",
      "day":"22:34"
    },
    {
      "title":"naruto",
      "sub":"hello im naturo",
      "day":"evening"
    },
    {
      "title":"kakashi",
      "sub":"hello im kakashi",
      "day":"12:03"
    },
    {
      "title":"tanjiro kamado",
      "sub":"hello im tanjiro",
      "day":"yesterday"
    }
  ];

}