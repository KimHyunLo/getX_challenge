import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:level3/screens/login.dart';
import 'package:level3/screens/welcome.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth authentication = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(authentication.currentUser);
    _user.bindStream(authentication.userChanges());
    ever(_user, _moveToPage);
  }

  _moveToPage(User? user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage());
    }
  }

  void register(String email, password) async {
    try {
      isLoading(true);
      await authentication.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading(false);
    } catch (e) {
      print(e);
      Get.snackbar(
        "Error message",
        "User message",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'Registration is failed',
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void login(String email, password) async {
    try {
      isLoading(true);
      await authentication.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading(false);
    } catch (e) {
      print(e);
      Get.snackbar(
        "Error message",
        "User message",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'Registration is failed',
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void logout() {
    authentication.signOut();
  }
}
