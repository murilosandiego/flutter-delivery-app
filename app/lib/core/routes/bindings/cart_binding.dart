import 'package:get/get.dart';
import 'package:delivery_app_getx/core/services/gql_client.dart';
import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/core/stores/cart_store.dart';
import 'package:delivery_app_getx/features/order/data/repositories/order_repository.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/cart/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRespository>(
        () => OrderRespositoryImpl(
              Get.find<HttpClient>(),
              Get.find<GraphQLClient>(),
            ),
        fenix: true);
    Get.lazyPut<CartController>(() =>
        CartController(Get.find<CartStore>(), Get.find<OrderRespository>()));
  }
}
