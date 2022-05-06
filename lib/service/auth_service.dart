import 'package:ebook_app/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> logIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = await UserService().getUserById(
        userCredential.user!.uid,
      );
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
    required int? age,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        age: age,
      );

      await UserService().setUser(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
