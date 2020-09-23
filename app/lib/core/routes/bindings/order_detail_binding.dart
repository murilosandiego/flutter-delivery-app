import 'package:get/get.dart';
import 'package:delivery_app_getx/features/order/data/repositories/order_repository.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/order_detail/order_detail_controller.dart';

class OrdersDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailController>(
      () => OrderDetailController(
        Get.find<OrderRespository>(),
      ),
    );
  }
}
