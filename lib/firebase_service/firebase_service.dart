import 'package:evently_c15_mon/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static Future<void> register({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    UserModel.currentUser = UserModel(
        name: credential.user?.displayName?? "noo", email: credential.user?.email?? "no email");
  }

  static bool get valid => true;

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
