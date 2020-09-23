import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/data/models/address_model.dart';
import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/user/data/repositories/user_repository.dart';

class AddressController extends GetxController {
  final UserRepository _userRepository;

  AddressController(this._userRepository);

  final appState = Rx<AppState>();

  removeAddress(AddressModel addressModel) async {
    try {
      appState.value = AppState.LOADING;
      final user = AuthStore.to.user.copyWith();
      user.adresses..removeWhere((element) => element.id == addressModel.id);
      final userReponse = await _userRepository.updateUser(user);

      AuthStore.to.saveUser(userReponse);
      Get.snackbar(
        ':)',
        'Endereço removido com sucesso!',
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );

      appState.value = AppState.DONE;
    } on Exception catch (_) {
      Get.snackbar(
        ':(',
        'Error ao remover endereço!',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      appState.value = AppState.ERROR;
    }
  }
}
