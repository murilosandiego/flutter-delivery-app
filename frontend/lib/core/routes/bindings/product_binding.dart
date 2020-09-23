import 'package:get/get.dart';
import 'package:delivery_app_getx/core/stores/cart_store.dart';
import 'package:delivery_app_getx/features/catalog/presentation/pages/product/product_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(Get.find<CartStore>()),
    );
  }
}
