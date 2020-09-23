import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';

import '../../../features/catalog/presentation/pages/home/home_page.dart';
import '../../../features/catalog/presentation/pages/store_detail/store_detail_page.dart';
import '../../../features/catalog/presentation/pages/stores/stores_page.dart';
import '../bindings/home_binding.dart';
import '../bindings/stores_binding.dart';
import '../bindings/stores_detail_binding.dart';

class HomeTabRouter extends StatelessWidget {
  static const navigatorIndex = 1000;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(navigatorIndex),
      initialRoute: '/',
      onGenerateRoute: onGenerateRouter,
    );
  }

  static Route onGenerateRouter(RouteSettings settings) {
    if (settings.name == '/') {
      return GetPageRoute(
        settings: settings,
        page: () => HomePage(),
        binding: HomeBinding(),
      );
    }

    if (settings.name == Routers.storesByCategory) {
      return GetPageRoute(
        settings: settings,
        page: () => StoresPage(
          category: settings.arguments,
        ),
        binding: StoresBindind(),
      );
    }

    if (settings.name == Routers.storeDetail) {
      return GetPageRoute(
        settings: settings,
        page: () => StoreDetailPage(
          store: settings.arguments,
        ),
        binding: StoresDetailBindind(),
      );
    }

    throw Exception('Não há página');
  }
}
