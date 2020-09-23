import 'package:get/get.dart';
import 'package:delivery_app_getx/core/data/repositories/util_repository.dart';
import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/features/user/data/repositories/user_repository.dart';
import 'package:delivery_app_getx/features/user/presentation/address_form/address_form_controller.dart';

class AddressFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UtilRepository>(
      () => UtilRepositoryImpl(Get.find<HttpClient>()),
    );
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(Get.find<HttpClient>()),
    );
    Get.lazyPut<AddressFormController>(
      () => AddressFormController(
        Get.find<UserRepository>(),
        Get.find<UtilRepository>(),
      ),
    );
  }
}
