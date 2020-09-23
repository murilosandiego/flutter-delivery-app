import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/presentation/components/styles.dart';
import '../../../../../core/stores/cart_store.dart';

class StoreName extends GetView<CartStore> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        controller.cart.value.store.name,
        style: h5,
      ),
    );
  }
}
