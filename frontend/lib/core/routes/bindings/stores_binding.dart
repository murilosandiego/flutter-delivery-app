import 'package:get/get.dart';
import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/features/catalog/data/repositories/store_repository.dart';
import 'package:delivery_app_getx/features/catalog/presentation/pages/stores/stores_controlller.dart';

class StoresBindind implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreRepository>(
      () => StoreRepositoryImpl(
        Get.find<HttpClient>(),
      ),
    );
    Get.lazyPut<StoresController>(
      () => StoresController(
        Get.find<StoreRepository>(),
      ),
    );
  }
}
