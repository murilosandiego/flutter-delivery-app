import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Get.back();
      },
      child: Text('Adicionar mais itens',
          style: TextStyle(
            color: Get.theme.primaryColor,
          )),
    );
  }
}
