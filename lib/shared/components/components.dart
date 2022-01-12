import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButtonText(
    {required String text, required VoidCallback function}) {
  return TextButton(onPressed: function, child: Text(text.toUpperCase(),style: TextStyle(color: Colors.white),));
}

Widget defaultFromField({
  required String label,
  required IconData prefix,
  required FormFieldValidator<String> validator,
  required TextEditingController controller,
  required TextInputType type,
  IconData? suffix,
  ValueChanged<String>? onChanged,
  GestureTapCallback? onTap,
  bool isClickable = true,
  bool isPassword = false,
  VoidCallback? onPressed,
  ValueChanged<String>? onFieldSubmitted,

}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: IconButton(
        icon: Icon(suffix),
        onPressed: onPressed,
      ),
    ),
    validator: validator,
    keyboardType: type,
    onTap: onTap,
    onChanged: onChanged,
    enabled: isClickable,
    obscureText: isPassword,
    onFieldSubmitted: onFieldSubmitted,
  );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (
        context,
      ) =>
              widget),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (
        context,
      ) =>
              widget),
      (Route<dynamic> rout) => false,
    );

void showToast({required String message, required ToastStates? state}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { Success, Error, Warning }

Color? chooseToastColor(ToastStates? state) {
  Color? color;
  // ignore: missing_enum_constant_in_switch
  switch (state) {
    case ToastStates.Success:
      color = Colors.green;
      break;
    case ToastStates.Error:
      color = Colors.red;
      break;
    case ToastStates.Warning:
      color = Colors.amber;
      break;
  }
  return color;
}
