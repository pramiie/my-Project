import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ListView1 extends StatefulWidget {
  final List<Map<String,dynamic>> data;
  const ListView1({super.key, required this.data,});
  @override
  State<ListView1> createState() => _ListViewState();
}

class _ListViewState extends State<ListView1> {
  @override
  Widget build(BuildContext context) {
    // var arrNames=["Özberk Şen","Elif Ecer","Burak Gülmez","İlayda Şeker"];

    return Scaffold(
        backgroundColor: const Color(0xFF6D5F9A),
      body: Expanded(
        child: Container(
        height: MediaQuery.of(context).size.height,
    width:  MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
    color: const Color(0xFF6D5F9A),
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(60.r),
    topRight: Radius.circular(60.r),
    ),
    ),


        child: Padding(
          padding: const EdgeInsets.only(top: 0,left: 15,right: 15),
          child: ListView.separated(itemBuilder:(context, index)
              {
                final data = widget.data[index];
          return ListTile(
            leading:const CircleAvatar(child: Icon(Icons.person_sharp, size: 30,),),
            title: Text(data["title"],
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),),
            subtitle:Text(data["sub"],
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),),
            trailing:Text(data["day"],
              style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),),
          );
              },
            itemCount:widget.data.length,
            separatorBuilder: (context,index){
            return Divider(height: 5.h,color: const Color(0xFFEFA985),thickness: 1.sp,);
            },
            ),
        ),
      )
));
  }

}
