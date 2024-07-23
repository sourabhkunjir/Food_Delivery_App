import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
    static void flushbarErrorMessage(String message, BuildContext context) {
    Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(15),
      message: message,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      icon: Icon(
        Icons.error,
        size: 28,
        color: Colors.white,
      ),
    )..show(context);
  }
}



