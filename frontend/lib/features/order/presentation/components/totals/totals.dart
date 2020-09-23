import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/core/stores/cart_store.dart';

class Totals extends GetView<CartStore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            'Subtotal',
            style: disabledText,
          ),
          trailing: Obx(() => Text(
                'R\$ ${controller.subTotal.toStringAsFixed(2)}',
                style: disabledText,
              )),
        ),
        ListTile(
          title: Text(
            'Taxa de entrega',
            style: disabledText,
          ),
          trailing: Obx(
            () => controller.cart().deliveryFee == null
                ? Text(
                    'Grátis',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : Text(
                    'R\$ ${controller.cart().deliveryFee.toStringAsFixed(2)}',
                    style: disabledText,
                  ),
          ),
        ),
        ListTile(
          title: Text(
            'Total',
            style: h4,
          ),
          trailing: Obx(() => Text(
                'R\$ ${controller.total.toStringAsFixed(2)}',
                style: h4,
              )),
        ),
      ],
    );
  }
}
