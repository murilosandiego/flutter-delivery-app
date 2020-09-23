import 'package:get/get.dart';
import 'package:delivery_app_getx/features/catalog/data/repositories/product_repository.dart';

import '../../../features/catalog/presentation/pages/store_detail/store_detail_controller.dart';
import '../../services/http_client.dart';

class StoresDetailBindind implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(
        Get.find<HttpClient>(),
      ),
    );
    Get.lazyPut<StoreDetailController>(
      () => StoreDetailController(
        Get.find<ProductRepository>(),
      ),
    );
  }
}
