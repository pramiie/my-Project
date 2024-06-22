import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tictactoe/framework/controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Controller controller=Get.put(Controller());

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Obx(() => Container(
                  decoration: BoxDecoration(
                    color: controller.isX.value==false? Colors.blue : Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                  child: Text("O",
                style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 40,color: Colors.white),),),),

                  Obx(() => Container(
                    decoration: BoxDecoration(
                      color: controller.isX.value==true? Colors.blue : Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                    child: Text("X",
                      style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 40,color: Colors.white),),),),
                ],),

          SizedBox(height: 50,),
              Expanded(
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          print(index);
                          controller.addValue(index);
                        },
                        child: Obx(
                            ()=> Container(
                            margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text(controller.gameValue[index],style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),))
                          ),
                        ));
                    },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
