import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:udemyecommerce/Routes/routes.dart';

class AuthController extends GetxController {
  bool isvisibility = false;
  bool ischecked = false;
  var Displayname = '';
  var displayuserphoto = '';
  var googlesignin = GoogleSignIn();

  FirebaseAuth auth = FirebaseAuth.instance;
  void visibility() {
    isvisibility = !isvisibility;
    update();
  }

  void checked() {
    ischecked = !ischecked;
    update();
  }

  void signupusingfirebase(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Displayname = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.mainscreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too week';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email';
      } else {
        message = e.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print(e);

      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void loginusingfirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Displayname = auth.currentUser!.displayName!;
      });
      update();
      Get.offNamed(Routes.mainscreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.code.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print(e);

      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  Future<void> googlesignup() async {
    try {
      final GoogleSignInAccount? googleUser = await googlesignin.signIn();
      Displayname = googleUser!.displayName!;
      displayuserphoto = googleUser.photoUrl!;
      update();
      Get.offNamed(Routes.mainscreen);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void resetpassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = e.code.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print(e);

      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signoutfromapp() {}

  void facebooksignuppapp() {}
}
