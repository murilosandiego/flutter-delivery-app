import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_flat_button/custom_flat_button.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';

import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
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
                  labelText: 'Nome Completo',
                  autocorrect: false,
                  onChanged: RegisterController.to.changeName,
                  errorText: RegisterController.to.nameIsValid
                      ? null
                      : 'Nome muito curto',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  labelText: 'Usuário',
                  autocorrect: false,
                  onChanged: RegisterController.to.changeUsername,
                  errorText: RegisterController.to.usernameIsValid
                      ? null
                      : 'Nome de usuário muito curto',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  labelText: 'E-mail',
                  autocorrect: false,
                  textInputType: TextInputType.emailAddress,
                  onChanged: RegisterController.to.changeEmail,
                  errorText: RegisterController.to.emailIsValid
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
                  onChanged: RegisterController.to.changePassword,
                  errorText: RegisterController.to.passwordIsValid
                      ? null
                      : 'Nome de usuário muito curto',
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

                      return Text('Cadastrar');
                    },
                  ),
                  onPressed: RegisterController.to.formRegisterIsValid
                      ? () {
                          RegisterController.to.registerLocal();
                        }
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
