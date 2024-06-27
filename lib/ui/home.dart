import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/framework/controller.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final boxWatch=ref.watch(controllerProvider);
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body:Form(
        key: boxWatch.bKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(
                  decoration: BoxDecoration(
                    color: boxWatch.isX==false? Colors.blue : Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                  child: Text("O",
                style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 40,color: Colors.white),),),


                   Container(
                    decoration: BoxDecoration(
                      color:boxWatch.isX==true? Colors.blue : Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                    child: Text("X",
                      style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 40,color: Colors.white),),
                   ),
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
                          boxWatch.addValue(index);
                        },
                        child: Container(
                            margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text(boxWatch.gameValue[index],style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),))
                          ),
                        );
                    },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
