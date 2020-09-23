import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:delivery_app_getx/core/data/models/address_model.dart';
import 'package:delivery_app_getx/core/data/repositories/util_repository.dart';
import 'package:delivery_app_getx/core/exceptions/app_exception.dart';
import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/user/data/repositories/user_repository.dart';

class AddressFormController extends GetxController {
  final UserRepository _userRepository;
  final UtilRepository _utilRepository;

  AddressFormController(this._userRepository, this._utilRepository);

  @override
  void onReady() {
    super.onReady();
    placeController.text = addressModel?.place ?? '';
    complementController.text = addressModel?.complement ?? '';
    districtController.text = addressModel?.district ?? '';
    cityController.text = addressModel?.city ?? '';
    state.value = addressModel?.state ?? '';
  }

  final cepIsValid = true.obs;
  final cepLoading = false.obs;
  final state = ''.obs;
  final appState = Rx<AppState>();

  final placeController = TextEditingController();
  final complementController = TextEditingController();
  final districtController = TextEditingController();
  final cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AddressModel addressModel = AddressModel();

  onChangedCep(String cep) {
    if (cep.isEmpty) {
      cepIsValid(true);
      cleanControllers();
      return;
    }

    final cepOnlyDigits = GetUtils.numericOnly(cep);
    if (cepOnlyDigits.length == 8) {
      fetchAddress(cepOnlyDigits);
      return;
    }

    cepIsValid(false);
  }

  Future fetchAddress(cep) async {
    try {
      cepLoading(true);
      final data = await _utilRepository.findAddressByCep(cep);

      placeController.text = data.place;
      complementController.text = data.complement;
      districtController.text = data.district;
      cityController.text = data.city;
      state.value = data.state;

      cepIsValid(true);
      cepLoading(false);
    } on AppException catch (e) {
      if (e.message == 'invalid_cep') {
        cepIsValid(false);
        cepLoading(false);
      }
    }
  }

  cleanControllers() {
    placeController.text = '';
    complementController.text = '';
    districtController.text = '';
    cityController.text = '';
    state.value = '';
  }

  String defaultValidator(String value) {
    if (value.isNullOrBlank) return 'Campo obrigatório';
    return null;
  }

  submitForm() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      try {
        appState.value = AppState.LOADING;
        final user = AuthStore.to.user.copyWith();
        user.adresses.add(addressModel);

        final userReponse = await _userRepository.updateUser(user);

        AuthStore.to.saveUser(userReponse);
        Get.snackbar(
          ':)',
          'Endereço salvo com sucesso!',
          colorText: Colors.white,
          backgroundColor: Colors.green,
          snackbarStatus: (status) {
            if (status == SnackbarStatus.CLOSED) {
              Get.back();
            }
          },
        );

        appState.value = AppState.DONE;
      } on Exception catch (_) {
        Get.snackbar(
          ':(',
          'Error ao salvar endereço!',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        appState.value = AppState.ERROR;
      }
    }
  }
}
