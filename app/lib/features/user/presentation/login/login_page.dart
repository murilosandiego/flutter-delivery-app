import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_flat_button/custom_flat_button.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            // key: key,
            child: Obx(
              () => ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Image.asset('images/welcome.png', width: 190, height: 100),
                  Text(
                    'GetX Delivery',
                    style: logoStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    labelText: 'Usuário ou E-mail',
                    autocorrect: false,
                    onChanged: LoginController.to.changeUsername,
                    errorText: LoginController.to.usernameIsValid
                        ? null
                        : 'E-email inválido',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    labelText: 'Senha',
                    autocorrect: false,
                    obscureText: true,
                    onChanged: LoginController.to.changePassword,
                    errorText: LoginController.to.passwordIsValid
                        ? null
                        : 'Senha muito curta',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomFlatButton(
                    child: Obx(
                      () {
                        if (controller.appState() == AppState.LOADING) {
                          return CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          );
                        }

                        return Text('Entrar');
                      },
                    ),
                    onPressed: LoginController.to.formLoginIsValid
                        ? () => LoginController.to.authLocal()
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // backgroundColor: bgColor,
    );
  }
}
