import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_flat_button/custom_flat_button.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/order/presentation/pages/payment_types/payment_types_controller.dart';

class PaymentTypesPage extends GetView<PaymentTypesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forma de pagamento'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.appState() == AppState.LOADING) {
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
                  onPressed: () => controller.getPaymentTypes(),
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                Text(
                  'Pague pelo App',
                  style: h5,
                ),
                Divider(),
                ListView.separated(
                  separatorBuilder: (_, __) => Divider(),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.paymentTypesApp.length,
                  itemBuilder: (_, index) {
                    final paymentType = controller.paymentTypesApp[index];
                    return ListTile(
                      title: Text(
                        paymentType.name,
                        style: disabledText,
                      ),
                      trailing: Text(
                        'Em breve',
                        style: disabledText,
                      ),
                      // onTap: () => controller.addPaymentType(paymentType),
                      contentPadding: EdgeInsets.zero,
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Pague na Entrega',
                  style: h5,
                ),
                Divider(),
                ListView.separated(
                  separatorBuilder: (_, __) => Divider(),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.paymentTypesStore.length,
                  itemBuilder: (_, index) {
                    final paymentType = controller.paymentTypesStore[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        paymentType.name,
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      onTap: () => controller.addPaymentType(paymentType),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
