import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/stores/cart_store.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Pagamento',
            style: h6,
          ),
          Divider(),
          ListTile(
            onTap: () => Get.toNamed(Routers.paymentTypes),
            contentPadding: EdgeInsets.only(left: 0),
            title: Text('Formas de pagamento'),
            trailing: Obx(
              () => CartStore.to.cart().paymentType == null
                  ? Text(
                      'Escolher',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      'Alterar',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            subtitle: Obx(
              () => CartStore.to.cart().paymentType != null
                  ? Text('${CartStore.to.cart().paymentType.name}')
                  : Container(),
            ),
          )
        ],
      ),
    );
  }
}
