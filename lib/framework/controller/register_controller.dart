import 'package:chat_app/ui/home.dart';
import 'package:chat_app/ui/utils/Common_widget/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/firebase_auth_service.dart';
final registerController = ChangeNotifierProvider((ref) => RegisterController());
class RegisterController extends ChangeNotifier {

  final GlobalKey<FormState> registerKey=GlobalKey();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

 Future signUpButton(BuildContext context)async{
if(registerKey.currentState!.validate()){
    if(passwordController.text==confirmPasswordController.text){
      final authResponse = await FirebaseAuthService.authService.signUpWithEmailAndPass(email: emailController.text, password: passwordController.text);
      if(authResponse.user != null){
        if(context.mounted){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Bnb()), (route) => false);
        }
      }


    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("password doesn't matched")));
    }
}else{
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Enter Valid email and password")));
}
    }
}
