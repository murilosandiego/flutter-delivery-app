import 'package:get/get.dart';
import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/features/catalog/data/repositories/category_repository.dart';
import 'package:delivery_app_getx/features/catalog/data/repositories/product_repository.dart';
import 'package:delivery_app_getx/features/catalog/data/repositories/store_repository.dart';
import 'package:delivery_app_getx/features/catalog/presentation/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryRepository>(
      () => CategoryRepositoryImpl(
        Get.find<HttpClient>(),
      ),
      fenix: true,
    );
    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(
        Get.find<HttpClient>(),
      ),
      fenix: true,
    );
    Get.lazyPut<StoreRepository>(
      () => StoreRepositoryImpl(
        Get.find<HttpClient>(),
      ),
      fenix: true,
    );
    Get.lazyPut<HomeController>(
        () => HomeController(
              Get.find<CategoryRepository>(),
              Get.find<ProductRepository>(),
              Get.find<StoreRepository>(),
            ),
        fenix: true);
  }
}
