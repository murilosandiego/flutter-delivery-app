import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:delivery_app_getx/core/data/models/address_model.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/user/presentation/address/address_controller.dart';

class AddressPage extends GetView<AddressController> {
  final Function onTap;

  AddressPage({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Endereços de entrega'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Get.toNamed(
              Routers.addresesForm,
            ),
          )
        ],
      ),
      body: MixinBuilder<AuthStore>(builder: ($) {
        if (controller.appState() == AppState.LOADING) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.separated(
          separatorBuilder: (_, __) => Divider(),
          itemCount: $.user.adresses.length,
          itemBuilder: (_, index) {
            final address = $.user.adresses[index];
            return ListTile(
              onTap: () => getBottomSheet(address),
              title: Text(address.name),
              subtitle: Text(
                  '${address.place}, ${address.number}, ${address.district}'),
              trailing: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryColor,
              ),
            );
          },
        );
      }),
    );
  }

  Future getBottomSheet(AddressModel addressModel) {
    return Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Wrap(
          children: <Widget>[
            if (onTap != null)
              ListTile(
                onTap: () {
                  onTap(addressModel);
                  Get.back();
                  Get.back();
                },
                title: Text(
                  'Escolher',
                  textAlign: TextAlign.center,
                ),
              ),
            ListTile(
              onTap: () {
                Get.back();
                Get.toNamed(
                  Routers.addresesForm,
                  arguments: addressModel,
                );
              },
              title: Text(
                'Editar',
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              onTap: () {
                Get.back();
                modalDelete(
                  () {
                    controller.removeAddress(addressModel);
                    Get.back();
                  },
                  () => Get.back(),
                );
              },
              title: Text(
                'Remover',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future modalDelete(Function confirm, Function cancel) {
    return Get.defaultDialog(
      title: 'Remover?',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
            'Tem certeza que deseja remover? Essa ação não poderá ser desfeita'),
      ),
      actions: <Widget>[
        RaisedButton(
          onPressed: confirm,
          child: Text(
            'Sim',
            style: TextStyle(color: Colors.white),
          ),
        ),
        FlatButton(
          onPressed: cancel,
          child: Text(
            'Não',
            // style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
