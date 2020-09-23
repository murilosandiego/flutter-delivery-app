import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final Function onTap;
  final ValueChanged<String> onChanged;
  final Function onEditingComplete;
  final bool obscureText;
  final TextInputType textInputType;
  final Function(String) onSaved;
  final bool autocorrect;
  final FormFieldValidator<String> validator;
  final String errorText;
  final String initialValue;
  final TextEditingController controller;
  final int maxLines;
  final List<TextInputFormatter> inputFormatters;
  final bool autovalidate;
  final String hintText;
  final TextInputAction textInputAction;
  final Widget suffix;
  final Widget suffixIcon;

  const CustomTextFormField({
    Key key,
    @required this.labelText,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.textInputType,
    this.onSaved,
    this.autocorrect = false,
    this.obscureText = false,
    this.validator,
    this.errorText,
    this.initialValue,
    this.controller,
    this.maxLines = 1,
    this.inputFormatters,
    this.autovalidate = false,
    this.hintText,
    this.textInputAction,
    this.suffix,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        textInputAction: textInputAction,
        autovalidate: autovalidate,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        controller: controller,
        initialValue: initialValue,
        onTap: onTap,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        cursorColor: Get.theme.primaryColor,
        style: inputFieldTextStyle,
        obscureText: obscureText,
        keyboardType: textInputType,
        onSaved: onSaved,
        autocorrect: autocorrect,
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffix: suffix,
          hintText: hintText,
          errorText: errorText,
          labelText: labelText,
          hintStyle: inputFieldHintTextStyle,
          focusedBorder: inputFieldFocusedBorderStyle,
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          border: inputFieldDefaultBorderStyle,
        ),
      ),
    );
  }
}
