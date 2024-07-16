import 'package:chat_app/ui/home.dart';
import 'package:chat_app/ui/utils/Common_widget/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/firebase_auth_service.dart';
final loginController = ChangeNotifierProvider((ref) => LoginController());
class LoginController extends ChangeNotifier {

  final GlobalKey<FormState> loginKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signInButton(BuildContext context)async{
    if(loginKey.currentState!.validate()){
      print(emailController.text);
      print(passwordController.text);
      final  response = await FirebaseAuthService.authService.signInWithEmailAndPass(email:emailController.text, password: passwordController.text);
      if(response.user != null){
        if(context.mounted){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const Bnb()), (route) => false);

        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.error!)));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Enter Valid email and pass")));
    }
  }
}