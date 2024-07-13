import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/framework/model/auth_response.dart';
import 'package:chat_app/framework/model/user_model.dart';
import 'package:chat_app/framework/service/firbase_singleton.dart';

class FirebaseAuthService {

  FirebaseAuthService._();

  static FirebaseAuthService authService = FirebaseAuthService._();

  FirebaseAuth auth = FirebaseAuth.instance;


  Future<AuthResponse> signUpWithEmailAndPass({required String email,required String password})async{
    try{
      final UserCredential response = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if(response.user != null){
        final uid=FirebaseSingleTon.firebaseSingleTon.firebaseAuth.currentUser!.uid;
        return AuthResponse(user: UserModel(email: response.user!.email!,uid:uid));
      }else{
        return AuthResponse(error: "user is already exist");
      }
    }on FirebaseAuthException catch(e){
      Future.error(e.message.toString());
      return AuthResponse(error:e.message.toString());
    }
  }
  Future<AuthResponse> signInWithEmailAndPass({required String email,required String password})async{
    try{
      final response = await auth.signInWithEmailAndPassword(email: email, password: password);
      if(response.user != null){
        return AuthResponse(user: UserModel(email: response.user!.email!, uid: ''));
      }else{
        return AuthResponse(error: "user not found");
      }
    }on FirebaseAuthException catch(e){
      Future.error(e.message.toString());
      return AuthResponse(error: e.message.toString());
    }
  }
}