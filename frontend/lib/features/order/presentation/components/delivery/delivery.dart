import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/stores/cart_store.dart';

class Delivery extends GetView<CartStore> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(
                controller.cart().delivery ? 'Entrega' : 'Retirada',
                style: h6,
              ),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: getBottomSheet,
            ),
            if (controller.cart().delivery) Divider(),
            if (controller.cart().delivery)
              controller.cart().address == null
                  ? ListTile(
                      onTap: () => Get.toNamed(
                        Routers.addreses,
                        arguments: controller.changeDeliveryAddress,
                      ),
                      contentPadding: EdgeInsets.only(left: 0),
                      title: Text('Endereço'),
                      trailing: Text(
                        'Escolher',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListTile(
                      onTap: () => Get.toNamed(
                        Routers.addreses,
                        arguments: controller.changeDeliveryAddress,
                      ),
                      contentPadding: EdgeInsets.only(left: 0),
                      title: Text(controller.cart().address.name),
                      subtitle: Text(
                          '${controller.cart().address.place}, ${controller.cart().address.number}, ${controller.cart().address.district}'),
                      trailing: Text(
                        'Alterar',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }

  Future getBottomSheet() {
    return Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Wrap(
          children: <Widget>[
            ListTile(
              title: Text(
                'Selecionar opção',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: h5,
                textAlign: TextAlign.center,
              ),
              subtitle: Text('Os preços e os itens do cardápio podem variar'),
            ),
            ListTile(
              title: Text(
                'Entrega',
                style: h6,
              ),
              onTap: () {
                controller.changeDelivery(true);
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                'Retirada',
                style: h6,
              ),
              onTap: () {
                controller.changeDelivery(false);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
