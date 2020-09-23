import 'package:get/get.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/order/data/models/order_model.dart';
import 'package:delivery_app_getx/features/order/data/repositories/order_repository.dart';

class OrdersController extends GetxController {
  static OrdersController get to => Get.find();
  final OrderRespository _orderRespository;

  OrdersController(this._orderRespository);

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  final orders = RxList<OrderModel>();
  final appState = Rx<AppState>();

  void fetchOrders() async {
    appState.value = AppState.LOADING;

    final user = AuthStore.to.user;
    try {
      final data = await _orderRespository.getOrdersByUser(userId: user.id);
      orders.value = data;
      appState.value = AppState.DONE;
    } on HasuraError catch (e) {
      if (e.message == 'Invalid token.') {
        Get.offAllNamed(Routers.login);
      }
      appState.value = AppState.ERROR;
    } on Exception catch (_) {
      appState.value = AppState.ERROR;
    }
  }
}
