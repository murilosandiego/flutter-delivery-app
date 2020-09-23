import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_flat_button/custom_flat_button.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_outline_buttom/custom_outline_button.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('images/welcome.png', height: 90),
              Text(
                'GetX Delivery',
                style: logoStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              CustomFlatButton(
                  child: Text('Entrar'),
                  onPressed: () {
                    Get.toNamed(Routers.login);
                  }),
              SizedBox(
                height: 10,
              ),
              CustomOutlineButton(
                  text: 'Cadastrar',
                  onPressed: () {
                    Get.toNamed(Routers.register);
                  }),
            ],
          )),
      // backgroundColor: bgColor,
    );
  }
}
