import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_flat_button/custom_flat_button.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/order/data/models/order_model.dart';
import 'package:delivery_app_getx/features/order/presentation/components/order_tile/order_tile.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/orders/orders_controller.dart';

class OrdersPage extends GetView<OrdersController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Em andamento',
                ),
                Tab(
                  text: 'Anteriores',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Obx(
              () {
                if (controller.appState() == AppState.LOADING) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.appState() == AppState.ERROR) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.appState() == AppState.ERROR) {
                  return Center(
                    child: Container(
                      width: 180,
                      child: CustomFlatButton(
                        child: Text('Buscar novamente'),
                        onPressed: () => controller.fetchOrders(),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: controller.orders.length,
                  itemBuilder: (_, index) {
                    final OrderModel order = controller.orders[index];
                    return OrderTile(
                      order: order,
                    );
                  },
                );
              },
            ),
            Center(
              child: Text('ok'),
            )
          ],
        ),
      ),
    );
  }
}
