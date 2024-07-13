import 'package:chat_app/ui/chats.dart';
import 'package:chat_app/ui/setting.dart';
import 'package:chat_app/ui/utils/Common_widget/listView.dart';
import 'package:chat_app/ui/utils/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> widgetList = const[
    Chats(),
    Home(),
    Setting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
   // var arrNames=["Özberk Şen","Elif Ecer","Burak Gülmez","İlayda Şeker"];
    return Scaffold(
      body: Container(
        color: Color(0xFF4D426D),
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 37.0),
              child: Text("Contact",style: TextStyle(fontSize:24.sp,fontWeight: FontWeight.w800,color: Colors.white)),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width:  MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF6D5F9A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.r),
                    topRight: Radius.circular(60.r),
                  ),
                ),
                child: Column(
                  children:[
                    SizedBox(height: 45.h,),
                    Expanded(child: ListView1(data: lists,),)
                  ]
                ),),
              ),

      


     ] ),
    ));
  }
  List<Map<String,dynamic>> lists=[
    {
      "title":"parth",
      "sub":"hello im parth",
      "day":""
    },
    {
      "title":"goku",
      "sub":"hello im goku",
      "day":""
    },
    {
      "title":"naruto",
      "sub":"hello im naturo",
      "day":""
    },
    {
      "title":"kakashi",
      "sub":"hello im kakashi",
      "day":""
    },
    {
      "title":"tanjiro kamado",
      "sub":"hello im tanjiro",
      "day":""
    }
  ];
}

