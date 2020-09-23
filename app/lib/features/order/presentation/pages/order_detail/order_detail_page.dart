import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/order_detail/order_detail_controller.dart';

class OrderDetailPage extends GetView<OrderDetailController> {
  final int orderId;

  OrderDetailPage({this.orderId}) : assert(orderId != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do pedido', style: h4),
        centerTitle: true,
      ),
      body: GetBuilder<OrderDetailController>(
        initState: (_) => controller.fetchOrder(orderId),
        id: OrderDetailController.idOrder,
        builder: ($) => $.order != null
            ? Text($.order.id.toString())
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
