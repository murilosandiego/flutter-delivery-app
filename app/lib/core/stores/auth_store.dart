import 'package:delivery_app_getx/core/stores/cart_store.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/services/local_storage_get.dart';
import 'package:delivery_app_getx/features/user/data/models/user_model.dart';

import '../../features/user/data/models/auth_model.dart';

class AuthStore extends GetxController {
  AuthStore(this._storage);

  static AuthStore get to => Get.find();

  static const TOKEN = 'TOKEN';
  static const USER = 'USER';

  String token;
  UserModel user;
  bool isLoggin;

  final LocalStorage _storage;
  final isLogged = true.obs;

  @override
  void onInit() {
    ever(isLogged, fireRoute);
    super.onInit();
    token = _storage.read(TOKEN);
    user = _storage.read(USER, construct: (map) => UserModel.fromMap(map));
    if (token == null && user == null) {
      isLogged.value = false;
    }
  }

  fireRoute(logged) {
    if (!logged) {
      Get.toNamed(Routers.initialRoute);
    }
  }

  void save(AppModel app) {
    saveUser(app.user);
    saveToken(app.jwt);
    update();
  }

  void saveUser(UserModel user) async {
    await _storage.write(USER, user.toMap());
    this.user = user;
    update();
  }

  void saveToken(String token) async {
    await _storage.write(TOKEN, token);
    this.token = token;
    update();
  }

  Future<void> logout() async {
    CartStore.to.clear();
    await _storage.remove(USER);
    await _storage.remove(TOKEN);
    user = null;
    token = null;
    isLogged.value = false;
    update();
    Get.offNamedUntil(Routers.initialRoute, (route) => false);
  }
}
