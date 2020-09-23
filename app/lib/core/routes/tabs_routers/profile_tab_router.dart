import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/routes/bindings/address_form_binding.dart';
import 'package:delivery_app_getx/core/routes/bindings/profile_binding.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/features/user/presentation/address_form/adderss_form_page.dart';
import 'package:delivery_app_getx/features/user/presentation/profile/profile_page.dart';
import 'package:delivery_app_getx/features/user/presentation/profile_detail/profile_detail_page.dart';

class ProfileTabRouter extends StatelessWidget {
  static const navigatorIndex = 4000;

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
        page: () => ProfilePage(),
        binding: ProfileBinding(),
      );
    }

    if (settings.name == Routers.profileDetail) {
      return GetPageRoute(
        settings: settings,
        page: () => ProfileDetailPage(),
      );
    }

    // if (settings.name == Routers.addreses) {
    //   return GetPageRoute(
    //     settings: settings,
    //     page: () => AddressPage(),
    //     binding: AddressBinding(),
    //   );
    // }

    if (settings.name == Routers.addresesForm) {
      return GetPageRoute(
        settings: settings,
        page: () => AddressFormPage(
          addressEdit: settings.arguments,
        ),
        binding: AddressFormBinding(),
      );
    }

    throw Exception('Não há página');
  }
}
