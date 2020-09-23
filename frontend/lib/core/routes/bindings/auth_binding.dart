import 'package:delivery_app_getx/features/user/presentation/register/register_controller.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/features/user/data/repositories/auth_repository.dart';
import 'package:delivery_app_getx/features/user/presentation/login/login_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(Get.find<HttpClient>()));
    Get.lazyPut<LoginController>(
      () => LoginController(
        Get.find<AuthRepository>(),
      ),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(
        Get.find<AuthRepository>(),
      ),
    );
  }
}
