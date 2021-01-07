import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../enums.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  AppState _appState = AppState.initial;

  AppState get appState => this._appState;
  User get user => this._user;

  AuthController.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((firebaseUser) {
      if (firebaseUser == null) {
        _appState = AppState.unauthenticated;
      } else {
        _user = firebaseUser;
        _appState = AppState.authenticated;
      }
      update();
    });
  }
  // ignore: missing_return
  static Future<void> fireStoreLogin(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  microsoftLogin() {
    _appState = AppState.authenticating;
    update();
    try {
      OAuthProvider provider = OAuthProvider('microsoft.com');
      provider.setCustomParameters(
          {'tenant': 'b91c98b1-d543-428b-9469-f5f8f25bc37b'});
      _auth.signInWithPopup(provider);
    } catch (e) {
      print("Got error on microsoft login");
      _appState = AppState.authenticated;
      update();
    }
  }

  void logout() async {
    await _auth.signOut();
    _appState = AppState.unauthenticated;
    update();
    // return Future.delayed(Duration.zero);
  }
}
