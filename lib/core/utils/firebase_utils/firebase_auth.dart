import 'dart:developer';

import 'package:evently_app/core/services/snackbar_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class FirebaseAuthUtils {
  static Future<bool> signUpWithEmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        SnackBarService.showErrorMessage("The password provided is too weak.");
        EasyLoading.dismiss();
        return Future.value(false);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        SnackBarService.showErrorMessage(
          "The account already exists for that email.",
        );
        EasyLoading.dismiss();
        return Future.value(false);
      }
      EasyLoading.dismiss();
      return Future.value(false);
    } catch (e) {
      print(e);
      EasyLoading.dismiss();
      return Future.value(false);
    }
  }

  static Future<bool> signInWithEmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      log(e.code ?? "");
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        SnackBarService.showErrorMessage('No user found for that email.');
        return Future.value(false);
      } else if (e.code == 'invalid-credential') {
        print('Wrong password provided for that user.');
        SnackBarService.showErrorMessage(
          'Wrong password provided for that user.',
        );
        EasyLoading.dismiss();
        return Future.value(false);
      }
      return Future.value(false);
    }
  }
}
