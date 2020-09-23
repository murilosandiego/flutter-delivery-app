import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/user/presentation/profile_form/profile_form_controller.dart';

class ProfileFormPage extends GetView<ProfileFormController> {
  final Map<String, dynamic> arguments;

  const ProfileFormPage({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${arguments['name']}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: CustomTextFormField(
                autovalidate: true,
                validator: (value) {
                  if (arguments['name'] == ProfileFormController.phone) {
                    return controller.phoneValidator(value);
                  }

                  if (arguments['name'] == ProfileFormController.cpf) {
                    return controller.cpfValidator(value);
                  }

                  if (arguments['name'] == ProfileFormController.fullName) {
                    return controller.nameValidator(value);
                  }

                  return null;
                },
                inputFormatters: arguments['inputFormatters'],
                onChanged: (value) {
                  controller.value = value;
                },
                labelText: arguments['name'],
                initialValue: arguments['input'],
              ),
            ),
            Container(
              height: 48,
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: Obx(
                () => RaisedButton(
                  textColor: Colors.white,
                  onPressed: controller.formIsValid()
                      ? () => controller.updateUser(arguments['name'])
                      : null,
                  child: controller.appState.value == AppState.LOADING
                      ? Center(
                          child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white)))
                      : Text('Atualizar'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
