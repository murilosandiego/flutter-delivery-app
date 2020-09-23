import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOutlineButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const CustomOutlineButton({Key key, this.onPressed, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: OutlineButton(
        onPressed: onPressed,
        child: Text(text),
        textColor: Get.theme.primaryColor,
        highlightedBorderColor: Get.theme.primaryColor,
        borderSide: BorderSide(color: Get.theme.primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
