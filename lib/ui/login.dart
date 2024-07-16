import 'package:chat_app/ui/register.dart';
import 'package:chat_app/ui/utils/Common_widget/common_button.dart';
import 'package:chat_app/ui/utils/Common_widget/textfield.dart';
import 'package:chat_app/ui/utils/form_validator.dart';
import 'package:chat_app/ui/utils/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/framework/controller/login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends ConsumerWidget{

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final loginWatch=ref.watch(loginController);
    return Scaffold(
        body:Container(
          color: Color(0xFF4D426D),
         width: MediaQuery.of(context).size.width,
          // width: 300.w,
          child: Form(
            key: loginWatch.loginKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 45.h),
                  Image.asset("assets/chatApp_logo 2.png",height: 134.h,width: 206.w,),
                  SizedBox(height: 45.h),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF6D5F9A),
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(60.r),topRight:Radius.circular(60.r),),
                ),

                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Sign In To Your Account",style: TextStyle(fontSize:20.sp,fontWeight: FontWeight.w600,color: Colors.white),),
                    SizedBox(height: 105.h,),
                    Text("   Email",style: TextStyle(fontSize:18.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                      TexField(controller: loginWatch.emailController,
                         hintText: "xyz@gmail.com", ),
                      SizedBox(height: 20.h,),
                    Text("   Password",style: TextStyle(fontSize:18.sp,fontWeight: FontWeight.w500,color: Colors.white),),

                    TexField(controller: loginWatch.passwordController,
                      validator: passwordValidator,
                      hintText: "......",
                      sufixIcon: Icon(Icons.lock_outlined),),

                      SizedBox(height: 60.h,),

                      Center(
                        child: Column(
                          children: [
                            CommonButton(onTap:(){
                              loginWatch.signInButton(context);
                            }),
                            SizedBox(height: 10.h,),
                            CommonButton(onTap:(){
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_)=> Register()));
                            },child: Text("Sign Up",style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w400,color: Colors.white)),),
                          ],
                        ),
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
