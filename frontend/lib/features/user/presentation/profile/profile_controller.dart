import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:get/state_manager.dart';

class ProfileController extends GetxController {
  final AuthStore _authStore;

  ProfileController(this._authStore);

  final appState = Rx<AppState>();

  void logout() async {
    try {
      appState.value = AppState.LOADING;
      await _authStore.logout();
      appState.value = AppState.DONE;
    } on Exception catch (_) {
      appState.value = AppState.ERROR;
    }
  }
}
