import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/routes/bindings/order_detail_binding.dart';
import 'package:delivery_app_getx/core/routes/bindings/orders_binding.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/order_detail/order_detail_page.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/orders/orders_page.dart';

class OrdersTabRouter extends StatelessWidget {
  static const navigatorIndex = 3000;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(navigatorIndex),
      initialRoute: Routers.initialRoute,
      onGenerateRoute: onGenerateRouter,
    );
  }

  static Route onGenerateRouter(RouteSettings settings) {
    if (settings.name == Routers.initialRoute) {
      return GetPageRoute(
        settings: settings,
        page: () => OrdersPage(),
        binding: OrdersBinding(),
      );
    }

    if (settings.name == Routers.orderDetail) {
      return GetPageRoute(
        settings: settings,
        page: () => OrderDetailPage(
          orderId: settings.arguments,
        ),
        binding: OrdersDetailBinding(),
      );
    }

    throw Exception('Não há página');
  }
}
