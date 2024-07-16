import 'package:chat_app/framework/controller/register_controller.dart';
import 'package:chat_app/ui/login.dart';
import 'package:chat_app/ui/utils/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/ui/utils/Common_widget/common_button.dart';
import 'package:chat_app/ui/utils/Common_widget/textfield.dart';
import 'package:chat_app/ui/utils/themes/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends ConsumerWidget{

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final registerWatch=ref.watch(registerController);
    return Scaffold(

      body:Container(
      
        color: Color(0xFF4D426D),
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: registerWatch.registerKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 26.h),

                  Image.asset("assets/chatApp_logo 2.png",height: 150.h,width: 88.w,),
                  SizedBox(height: 30.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF6D5F9A),
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(60.r),topRight:Radius.circular(60.r),),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(onPressed: (){Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );}, icon: Icon(Icons.arrow_back),color: Colors.white,),

                              Text("Create a Account",style: TextStyle(fontSize:20.sp,fontWeight: FontWeight.w600,color: Colors.white),),
                            ],
                          ),
                          SizedBox(height: 80.h,),
                          Text("   Username",style: TextStyle(fontSize:18.sp,fontWeight: FontWeight.w500,color: Colors.white),),

                          TexField(controller: registerWatch.nameController,),
                          SizedBox(height: 20.h,),
                          Text("   Email",style: TextStyle(fontSize:18.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                          TexField(hintText: "enes@gmail.com",
                            controller: registerWatch.emailController,
                            sufixIcon: Icon(Icons.mail_outline),),
                          SizedBox(height: 20.h,),
                          Text("   Password",style: TextStyle(fontSize:18.sp,fontWeight: FontWeight.w500,color: Colors.white),),

                          TexField(controller: registerWatch.passwordController,
                            validator: passwordValidator,
                            hintText: "......",
                            sufixIcon: Icon(Icons.lock_outline),),
                          SizedBox(height: 20.h,),
                          Text("   Password Again",style: TextStyle(fontSize:18.sp,fontWeight: FontWeight.w500,color: Colors.white),),

                          TexField(controller: registerWatch.confirmPasswordController,
                            validator: passwordValidator,
                            hintText: "......",
                            sufixIcon: Icon(Icons.lock_outlined),),

                          SizedBox(height: 60.h,),

                          Row(
                            children: [
                              Expanded(child: SizedBox()),
                              CommonButton(onTap:(){
                                registerWatch.signUpButton(context);
                              },child: Text("Sign Up",style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w400,color: Colors.white)),),
                              Expanded(child: SizedBox()),
                            ],
                          ),


                        ],
                      ),

                    ),
                  ),

                ],
              ),
            ),
          ),
        )

    );
  }
}
