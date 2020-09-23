import 'package:get/get.dart';
import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/features/user/data/repositories/user_repository.dart';
import 'package:delivery_app_getx/features/user/presentation/address/address_controller.dart';

class AddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(Get.find<HttpClient>()),
    );
    Get.lazyPut<AddressController>(
      () => AddressController(
        Get.find<UserRepository>(),
      ),
    );
  }
}
