import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/features/user/data/models/auth_model.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/utils/constants.dart';
import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/features/user/data/repositories/auth_repository.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();

  final AuthRepository _repository;

  RegisterController(this._repository);

  final name = ''.obs;
  final username = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final appState = Rx<AppState>();

  void changeName(String value) => name.value = value;

  void changeUsername(String value) => username.value = value;

  void changeEmail(String value) => email.value = value;

  void changePassword(String value) => password.value = value;

  void registerLocal() async {
    try {
      appState.value = AppState.LOADING;
      AppModel app = await _repository.registerLocal(
        name.value.trim(),
        username.value.trim(),
        email.value,
        password.value,
      );

      AuthStore.to.save(app);

      Get.offAllNamed(Routers.home);
      appState.value = AppState.DONE;
    } catch (e) {
      Get.snackbar(
        'Erro ao cadastrar',
        'Não foi possível fazer o cadastro',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      appState.value = AppState.ERROR;
    }
  }

  bool get nameIsValid {
    if (name.value.isNotEmpty && name.value.length < 3) return false;
    return true;
  }

  bool get usernameIsValid {
    if (username.value.isNotEmpty && username.value.length < 3) return false;
    return true;
  }

  bool get emailIsValid {
    final RegExp regExp = RegExp(patternMail);
    if (email.value.isNotEmpty && !regExp.hasMatch(email.value)) return false;
    return true;
  }

  bool get passwordIsValid {
    if (password.value.isNotEmpty && password.value.length < 6) return false;
    return true;
  }

  bool get formRegisterIsValid =>
      nameIsValid &&
      usernameIsValid &&
      passwordIsValid &&
      username.value.isNotEmpty &&
      password.value.isNotEmpty;
}
