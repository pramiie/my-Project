import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Controller extends GetxController{
  RxList<String> gameValue = ["","","","","","","","",""].obs;
  RxBool isX=false.obs;
  RxInt click=0.obs;
  void addValue(int index){
    if(gameValue[index]==""){
      if(isX.value){
        gameValue[index]="X";
        isX.value=!isX.value;
        click++;
      }
      else{
        gameValue[index]="O";
        isX.value=!isX.value;
        click++;
      }
    }else{
      print("Invalid Click");
    }
    matchDrawMessage(click.value);
  }
  void matchDrawMessage(click){
    if(click==9){
      Get.defaultDialog(
        title: "Match Draw",
        cancel: Text("Cancle"),
        confirm:TextButton(onPressed: () {
          gameValue.value = ["", "", "", "", "", "", "", "", ""];
          click.value=0;
          Get.back();
        }, child: Text("Play Again"),
      ),);
    }
  }
}