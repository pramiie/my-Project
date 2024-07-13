import 'package:chat_app/ui/utils/Common_widget/listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
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


    return Scaffold(
        backgroundColor: const Color(0xFF4D426D),
        body: Container(
          color: const Color(0xFF4D426D),
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,


          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37.0),
                  child: Text("Chats",style: TextStyle(fontSize:24.sp,fontWeight: FontWeight.w800,color: Colors.white)),
                ),
                SizedBox(height: 24.h,),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width:  MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6D5F9A),
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(60.r),topRight:Radius.circular(60.r),),
                    ),
                    child: Column(
                        children:[
                          SizedBox(height: 45.h,),
                           Expanded(child: ListView1(data: lists,),
                          )
                        ]
                    ),
                  ),
                ),



              ]  ),
        )
    );
  }
}