import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/features/user/data/models/auth_model.dart';
import 'package:delivery_app_getx/features/user/data/repositories/auth_repository.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final AuthRepository _repository;

  LoginController(this._repository);

  final username = ''.obs;
  final password = ''.obs;
  final appState = Rx<AppState>();

  void changeUsername(String value) => username.value = value;

  void changePassword(String value) => password.value = value;

  void authLocal() async {
    try {
      appState.value = AppState.LOADING;
      AppModel app =
          await _repository.authLocal(username.value.trim(), password.value);
      AuthStore.to.save(app);

      Get.offAllNamed(Routers.home);
      appState.value = AppState.DONE;
    } catch (e) {
      Get.snackbar(
        'Erro ao fazer login',
        'Login ou senha incorretos',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      appState.value = AppState.ERROR;
    }
  }

  bool get usernameIsValid {
    if (username.value.isNotEmpty && username.value.length < 3) return false;
    return true;
  }

  bool get passwordIsValid {
    if (password.value.isNotEmpty && password.value.length < 6) return false;
    return true;
  }

  bool get formLoginIsValid =>
      usernameIsValid &&
      passwordIsValid &&
      username.value.isNotEmpty &&
      password.value.isNotEmpty;
}
