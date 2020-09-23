import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/pages/base/base_page.dart';
import 'package:delivery_app_getx/core/presentation/pages/welcome/welcome_page.dart';
import 'package:delivery_app_getx/core/routes/bindings/address_binding.dart';
import 'package:delivery_app_getx/core/routes/bindings/address_form_binding.dart';
import 'package:delivery_app_getx/core/routes/bindings/cart_binding.dart';
import 'package:delivery_app_getx/core/routes/bindings/product_binding.dart';
import 'package:delivery_app_getx/core/routes/bindings/profile_binding.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/features/catalog/presentation/pages/product/product_page.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/cart/cart_page.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/payment_types/payment_types_page.dart';
import 'package:delivery_app_getx/features/user/presentation/address/address_page.dart';
import 'package:delivery_app_getx/features/user/presentation/address_form/adderss_form_page.dart';
import 'package:delivery_app_getx/features/user/presentation/login/login_page.dart';
import 'package:delivery_app_getx/features/user/presentation/profile_form/profile_form_page.dart';
import 'package:delivery_app_getx/features/user/presentation/register/register_page.dart';

import 'bindings/auth_binding.dart';
import 'bindings/payment_type_binding.dart';

class Pages {
  static List<GetPage> getPages = [
    GetPage(
      name: Routers.initialRoute,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: Routers.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routers.register,
      page: () => RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routers.home,
      page: () => BasePage(),
    ),
    GetPage(
      name: Routers.product,
      page: () => ProductPage(
        arguments: Get.arguments,
      ),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routers.cart,
      page: () => CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
        name: Routers.paymentTypes,
        page: () => PaymentTypesPage(),
        binding: PaymentTypeBinding()),
    GetPage(
      name: Routers.profileForm,
      page: () => ProfileFormPage(
        arguments: Get.arguments,
      ),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routers.addreses,
      page: () => AddressPage(
        onTap: Get.arguments,
      ),
      binding: AddressBinding(),
    ),
    GetPage(
      name: Routers.addresesForm,
      page: () => AddressFormPage(
        addressEdit: Get.arguments,
      ),
      binding: AddressFormBinding(),
    )
  ];
}
