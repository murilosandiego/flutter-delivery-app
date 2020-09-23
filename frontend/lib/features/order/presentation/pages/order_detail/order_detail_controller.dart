import 'package:get/get.dart';
import 'package:delivery_app_getx/features/order/data/models/order_model.dart';
import 'package:delivery_app_getx/features/order/data/repositories/order_repository.dart';

class OrderDetailController extends GetxController {
  static const idOrder = 'idOrder';

  static OrderDetailController get to => Get.find();
  final OrderRespository _orderRespository;

  OrderDetailController(this._orderRespository);

  OrderModel order;

  void fetchOrder(int orderId) async {
    order = await _orderRespository.getOrder(orderId);
    update([idOrder]);
  }
}
