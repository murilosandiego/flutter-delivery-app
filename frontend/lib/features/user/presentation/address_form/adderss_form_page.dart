import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/data/models/address_model.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/user/presentation/address_form/address_form_controller.dart';

class AddressFormPage extends GetView<AddressFormController> {
  final AddressModel addressEdit;

  const AddressFormPage({Key key, this.addressEdit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (addressEdit != null) {
      controller.addressModel = addressEdit.copyWith();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: addressEdit == null
            ? Text('Novo endereço')
            : Text('Editar endereço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Form(
                  key: controller.formKey,
                  child: ListView(
                    children: [
                      CustomTextFormField(
                        initialValue: controller.addressModel?.name ?? '',
                        labelText: 'Nome ex: minha casa',
                        validator: controller.defaultValidator,
                        onSaved: (value) {
                          controller.addressModel =
                              controller.addressModel.copyWith(name: value);
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        initialValue: controller.addressModel?.zipCode ?? '',
                        suffixIcon: controller.cepLoading()
                            ? Container(
                                width: 4,
                                height: 4,
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : SizedBox.shrink(),
                        textInputType: TextInputType.number,
                        labelText: 'CEP',
                        onChanged: controller.onChangedCep,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CepInputFormatter(),
                        ],
                        errorText:
                            controller.cepIsValid() ? null : 'CEP Inválido',
                        validator: controller.defaultValidator,
                        onSaved: (value) {
                          controller.addressModel =
                              controller.addressModel.copyWith(zipCode: value);
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        labelText: 'Logradouro',
                        maxLines: null,
                        controller: controller.placeController,
                        validator: controller.defaultValidator,
                        onSaved: (value) {
                          controller.addressModel =
                              controller.addressModel.copyWith(place: value);
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        labelText: 'Número',
                        initialValue: controller.addressModel?.number ?? '',
                        validator: controller.defaultValidator,
                        onSaved: (value) {
                          controller.addressModel =
                              controller.addressModel.copyWith(number: value);
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        controller: controller.complementController,
                        labelText: 'Complemento',
                        onSaved: (value) {
                          controller.addressModel = controller.addressModel
                              .copyWith(complement: value);
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        controller: controller.districtController,
                        labelText: 'Bairro',
                        validator: controller.defaultValidator,
                        onSaved: (value) {
                          controller.addressModel =
                              controller.addressModel.copyWith(district: value);
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        labelText: 'Cidade',
                        controller: controller.cityController,
                        validator: controller.defaultValidator,
                        onSaved: (value) {
                          controller.addressModel =
                              controller.addressModel.copyWith(city: value);
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropdownButtonFormField(
                        validator: controller.defaultValidator,
                        value: controller.state().isEmpty
                            ? null
                            : controller.state.toString(),
                        decoration: InputDecoration(
                          hintStyle: inputFieldHintTextStyle,
                          focusedBorder: inputFieldFocusedBorderStyle,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          border: inputFieldDefaultBorderStyle,
                        ),
                        items: getStates(),
                        isExpanded: true,
                        hint: Text('Estado'),
                        onChanged: (_) {},
                        onSaved: (value) {
                          controller.addressModel =
                              controller.addressModel.copyWith(state: value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 48,
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: Obx(
                () => RaisedButton(
                  textColor: Colors.white,
                  onPressed: controller.submitForm,
                  child: controller.appState.value == AppState.LOADING
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white))
                      : addressEdit != null
                          ? Text('Atualizar')
                          : Text('Salvar'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getStates() {
    return Estados.listaEstadosAbrv
        .map(
          (e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
  }
}
