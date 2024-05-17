import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

navigateTo(context, screen, bool isFinish) {
  if (isFinish) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        result: (route) => isFinish);
  } else {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }

}

flutterToast({required String msg, Color? backgroundColor}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

