import 'package:get/get.dart';
import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/features/order/data/repositories/payment_type_repository.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/payment_types/payment_types_controller.dart';

class PaymentTypeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentTypeRespository>(
      () => PaymentTypeRespositoryImpl(
        Get.find<HttpClient>(),
      ),
    );
    Get.lazyPut<PaymentTypesController>(
      () => PaymentTypesController(
        Get.find<PaymentTypeRespository>(),
      ),
    );
  }
}
