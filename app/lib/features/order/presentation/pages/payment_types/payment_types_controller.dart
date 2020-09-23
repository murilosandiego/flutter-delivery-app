import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:delivery_app_getx/core/stores/cart_store.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/order/data/models/payment_type_model.dart';
import 'package:delivery_app_getx/features/order/data/repositories/payment_type_repository.dart';

class PaymentTypesController extends GetxController {
  final PaymentTypeRespository _paymentTypeRespository;

  PaymentTypesController(this._paymentTypeRespository);

  final paymentTypesApp = RxList<PaymentTypeModel>();
  final paymentTypesStore = RxList<PaymentTypeModel>();
  final appState = Rx<AppState>();

  @override
  void onInit() {
    super.onInit();
    getPaymentTypes();
  }

  void getPaymentTypes() async {
    appState.value = AppState.LOADING;
    try {
      final paymentTypes = await _paymentTypeRespository.findPayments();

      paymentTypesApp.value = paymentTypes
          .where((paymentType) => paymentType.receive == PaymentTypeModel.app)
          .toList();

      paymentTypesStore.value = paymentTypes
          .where((paymentType) => paymentType.receive == PaymentTypeModel.store)
          .toList();

      appState.value = AppState.DONE;
    } on Exception catch (_) {
      Get.snackbar('Erro', 'Não foi possível buscar os tipos de pagamentos',
          colorText: Colors.white, backgroundColor: Colors.red);
      appState.value = AppState.ERROR;
    }
  }

  void addPaymentType(PaymentTypeModel paymentType) {
    CartStore.to.addPaymentType(paymentType);
    Get.back();
  }
}
