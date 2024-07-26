
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../ui/login.dart';
import '../model/user_model.dart';
import '../service/firebase_auth_service.dart';
import '../service/firebase_store.dart';
final registerController = ChangeNotifierProvider((ref) => RegisterController());
class RegisterController extends ChangeNotifier {

  final GlobalKey<FormState> registerKey = GlobalKey();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future signUpButton(BuildContext context) async {
    if (registerKey.currentState!.validate()) {

      if (passwordController.text == confirmPasswordController.text) {
        print(emailController.text);
        print(passwordController.text);
        final authResponse = await FirebaseAuthService.authService.signUpWithEmailAndPass(
            email: emailController.text, password: passwordController.text);
        if (authResponse.user != null) {
          final user = UserModel(uid: authResponse.user!.uid,
              email: emailController.text,
              name: nameController.text);
          FireStoreService.fireStoreService.addUserToFirebase(user);
          if (context.mounted) {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (_) => Login()), (
                route) => false);
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Please Enter Valid email and password")));
      }
    }
  }
}