import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/order/data/repositories/order_repository.dart';

import '../../../../../core/stores/cart_store.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  final CartStore _cartStore;
  final OrderRespository _orderRespository;

  CartController(this._cartStore, this._orderRespository);

  final appState = Rx<AppState>();

  void finishOrder() async {
    appState.value = AppState.LOADING;
    try {
      final cart = _cartStore.cart;

      await _orderRespository.createOrder(cart().toMap());
      Get.snackbar(
        ':)',
        'Pedido realizado com sucesso',
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackbarStatus: (status) {
          if (status == SnackbarStatus.CLOSED) {
            _cartStore.clear();
            Get.offAllNamed(Routers.home);
          }
        },
      );
      appState.value = AppState.DONE;
    } catch (e) {
      appState.value = AppState.ERROR;
      Get.snackbar(
        ':(',
        'Erro ao finalizar pedido',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}
