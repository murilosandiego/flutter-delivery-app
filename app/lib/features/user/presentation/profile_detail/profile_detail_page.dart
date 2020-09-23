import 'package:brasil_fields/brasil_fields.dart';
import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/features/user/presentation/components/item_data_tile/item_data_tile.dart';

class ProfileDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus dados'),
        centerTitle: true,
      ),
      body: GetBuilder<AuthStore>(
        builder: ($) => ListView(
          children: [
            ItemDataTile(
              name: 'Nome completo',
              description: $.user.name,
              onTap: () => Get.toNamed(
                Routers.profileForm,
                arguments: {'name': 'Nome completo', 'input': $.user.name},
              ),
            ),
            Divider(),
            ItemDataTile(
              name: 'CPF',
              description: $.user.cpf ?? '',
              onTap: () => Get.toNamed(
                Routers.profileForm,
                arguments: {
                  'user': $.user,
                  'name': 'CPF',
                  'input': $.user.cpf ?? '',
                  'inputFormatters': [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                },
              ),
            ),
            Divider(),
            ItemDataTile(
              name: 'Telefone',
              description: $.user.phone ?? '',
              onTap: () => Get.toNamed(
                Routers.profileForm,
                arguments: {
                  'name': 'Telefone',
                  'input': $.user.phone ?? '',
                  'inputFormatters': [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Email',
                style: disabledText,
              ),
              subtitle: Text(
                $.user.email,
                style: disabledText,
              ),
              trailing: InkWell(
                onTap: dialogInfo,
                child: Icon(Icons.info),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future dialogInfo() {
    return Get.defaultDialog(
      title: 'Observação',
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Essa informação não pode ser editada'),
      ),
    );
  }
}
