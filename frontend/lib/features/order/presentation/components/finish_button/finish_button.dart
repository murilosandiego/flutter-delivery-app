import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/stores/cart_store.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/cart/cart_controller.dart';

class FinishButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Obx(
        () => CartStore.to.cart().paymentType != null
            ? RaisedButton(
                textColor: Colors.white,
                onPressed: () => CartController.to.finishOrder(),
                child: Text('Fazer pedido'))
            : RaisedButton(
                textColor: Colors.white,
                onPressed: () => Get.toNamed(Routers.paymentTypes),
                child: Text('Escolher forma de pagamento'),
              ),
      ),
    );
  }
}
