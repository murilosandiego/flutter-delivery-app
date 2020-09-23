import 'package:delivery_app_getx/core/presentation/components/custom_flat_button/custom_flat_button.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/features/catalog/presentation/components/stores/stores.dart';
import 'package:delivery_app_getx/features/catalog/presentation/pages/home/home_controller.dart';

import '../../components/catetory/category.dart';
import '../../components/deals/deals.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Obx(
          () {
            if (controller.appState() == AppState.LOADING) {
              return Center(child: CircularProgressIndicator());
            }

            if (controller.appState() == AppState.ERROR) {
              return Center(
                  child: CustomFlatButton(
                child: Text('Buscar novamente'),
                onPressed: () => controller.fetchAll(),
              ));
            }
            return ListView(
              children: <Widget>[
                Category(),
                GetBuilder<HomeController>(
                  id: 'g-deals',
                  builder: ($) => Deals(
                    products: $.products,
                  ),
                ),
                Stores(),
              ],
            );
          },
        ),
      ),
    );
  }
}
