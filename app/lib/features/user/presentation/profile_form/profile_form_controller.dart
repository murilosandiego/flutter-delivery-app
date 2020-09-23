import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/exceptions/server_exception.dart';
import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/user/data/models/user_model.dart';
import 'package:delivery_app_getx/features/user/data/repositories/user_repository.dart';

class ProfileFormController extends GetxController {
  final UserRepository _userRepository;

  ProfileFormController(this._userRepository);

  static const cpf = 'CPF';
  static const fullName = 'Nome completo';
  static const phone = 'Telefone';

  String value = '';

  final formIsValid = false.obs;

  final appState = Rx<AppState>();

  void updateUser(String field) async {
    try {
      appState.value = AppState.LOADING;
      UserModel user = AuthStore.to.user;

      switch (field) {
        case cpf:
          user = user.copyWith(cpf: value);
          break;
        case fullName:
          user = user.copyWith(name: value);
          break;
        case phone:
          user = user.copyWith(phone: value);
          break;
      }

      final data = await _userRepository.updateUser(user);
      AuthStore.to.saveUser(data);
      appState.value = AppState.DONE;
      Get.snackbar(
        ':)',
        'Atualizado com sucesso',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on ServerException catch (e) {
      appState.value = AppState.ERROR;
      Get.snackbar(
        'Não foi possível atulizar',
        '${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } on Exception catch (e) {
      appState.value = AppState.ERROR;
      Get.snackbar(
        'Não foi possível atulizar',
        '${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  phoneValidator(String value) {
    if (value.isEmpty) {
      formIsValid.value = false;
      return null;
    }

    final component = GetUtils.numericOnly(value);
    if (component.length == 11) {
      formIsValid.value = true;
      return null;
    }

    formIsValid.value = false;
    return 'Número inválido';
  }

  cpfValidator(String value) {
    if (value.isEmpty) {
      formIsValid.value = false;
      return null;
    }

    if (GetUtils.isCpf(value)) {
      formIsValid.value = true;
      return null;
    }

    formIsValid.value = false;
    return 'CPF inválido';
  }

  nameValidator(String value) {
    if (value.isEmpty) {
      formIsValid.value = false;
      return null;
    }

    final nameSplit = value.trim().split(' ');

    if (nameSplit.length >= 2) {
      formIsValid.value = true;
      return null;
    }

    formIsValid.value = false;
    return 'Nome inválido';
  }
}
