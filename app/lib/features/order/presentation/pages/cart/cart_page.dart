import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/order/presentation/components/delivery/delivery.dart';
import 'package:delivery_app_getx/features/order/presentation/components/finish_button/finish_button.dart';
import 'package:delivery_app_getx/features/order/presentation/components/payment/payment.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/cart/cart_controller.dart';

import '../../components/add_more_button/add_more_button.dart';
import '../../components/cart_items/cart_items.dart';
import '../../components/store_name/store_name.dart';
import '../../components/totals/totals.dart';

class CartPage extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.expand_more,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text('Carrinho'),
      ),
      body: Obx(() {
        if (controller.appState.value == AppState.LOADING) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.appState.value == AppState.DONE) {
          return Container();
        }
        return Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  StoreName(),
                  Divider(),
                  CartItems(),
                  Divider(),
                  AddMoreButton(),
                  Divider(),
                  Totals(),
                  Divider(thickness: 10),
                  Delivery(),
                  Divider(thickness: 10),
                  Payment(),
                ],
              ),
            ),
            FinishButton(),
          ],
        );
      }),
    );
  }
}
