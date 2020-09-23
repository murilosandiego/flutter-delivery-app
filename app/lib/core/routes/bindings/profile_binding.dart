import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/features/user/presentation/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/features/user/data/repositories/user_repository.dart';
import 'package:delivery_app_getx/features/user/presentation/profile_form/profile_form_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(Get.find<HttpClient>()),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        Get.find<AuthStore>(),
      ),
      fenix: true,
    );
    Get.lazyPut<ProfileFormController>(
      () => ProfileFormController(
        Get.find<UserRepository>(),
      ),
    );
  }
}
