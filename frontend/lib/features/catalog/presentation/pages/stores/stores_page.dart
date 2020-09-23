import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/features/catalog/data/models/category_model.dart';
import 'package:delivery_app_getx/features/catalog/presentation/components/stores/store_tile.dart';
import 'package:delivery_app_getx/features/catalog/presentation/pages/stores/stores_controlller.dart';

class StoresPage extends StatelessWidget {
  final CategoryModel category;

  const StoresPage({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.name,
          style: h4,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<StoresController>(
        initState: (_) => StoresController.to.getStoresByCategory(category),
        id: 'g-stores-list',
        builder: ($) => $.stores == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: $.stores.length,
                itemBuilder: (_, index) {
                  final store = $.stores[index];
                  return StoreTile(store: store);
                },
              ),
      ),
    );
  }
}
