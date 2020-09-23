import 'package:get/get.dart';
import 'package:delivery_app_getx/core/services/gql_client.dart';
import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/features/order/data/repositories/order_repository.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/orders/orders_controller.dart';

class OrdersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRespository>(
      () => OrderRespositoryImpl(
        Get.find<HttpClient>(),
        Get.find<GraphQLClient>(),
      ),
      fenix: true,
    );

    Get.lazyPut<OrdersController>(
      () => OrdersController(
        Get.find<OrderRespository>(),
      ),
      fenix: true,
    );
  }
}
