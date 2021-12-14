import 'package:flutter/material.dart';

class Validation {
  // static String? validateEmail(String val, String message) {
  //   if (!GetUtils.isEmail(val)) {
  //     return message;
  //   }
  // }

  // static String? validatePassword(
  //     String val, String lessCharMessage, capCharMessage) {
  //   if (GetUtils.isLengthLessThan(val, 6)) {
  //     return lessCharMessage;
  //   }
  //   if (!GetUtils.hasCapitalletter(val)) {
  //     return capCharMessage;
  //   }

  //   return null;
  // }

  void showMySnack(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message.toString(),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    ));
  }

  void getMessageFromErrorCode(BuildContext context, message) {
    switch (message.toString()) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        showMySnack(context, message);
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        showMySnack(context, message);
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        showMySnack(context, message);
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        showMySnack(context, message);
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        showMySnack(context, message);
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        showMySnack(context, message);
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        showMySnack(context, message);
        break;
      default:
        showMySnack(context, message);
        break;
    }
  }
}
