import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseSingleTon{
  FirebaseSingleTon._();
  static FirebaseSingleTon firebaseSingleTon = FirebaseSingleTon._();

  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

}