
import 'package:chat_app/framework/model/user_model.dart';


import 'firbase_singleton.dart';

class FireStoreService {
  FireStoreService._();

  static FireStoreService fireStoreService = FireStoreService._();

  Future<void> addUserToFirebase(UserModel user) async {
    FirebaseSingleTon.firebaseSingleTon.fireStore
        .collection('user')
        .doc(user.uid)
        .set(user.toJson());
  }
}