import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/stores/cart_store.dart';
import 'cart_tile.dart';

class CartItems extends GetView<CartStore> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.cart.value.items.length,
        itemBuilder: (_, index) {
          final cart = controller.cart.value.items[index];
          return CartTile(cart);
        },
        separatorBuilder: (_, __) => Divider(),
      ),
    );
  }
}
