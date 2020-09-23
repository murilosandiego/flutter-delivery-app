import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';
import 'package:delivery_app_getx/features/catalog/presentation/components/stores/store_tile.dart';
import 'package:delivery_app_getx/features/catalog/presentation/pages/home/home_controller.dart';

import '../header_section/header_section.dart';

class Stores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HeaderSection(
          headerTitle: 'Bares, Lanches, Mercados...',
          onViewMore: () {},
        ),
        GetBuilder<HomeController>(
          id: 'g-stores',
          builder: (c) => ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: c.stores.length,
            itemBuilder: (_, index) {
              final StoreModel store = c.stores[index];
              return StoreTile(store: store);
            },
          ),
        )
      ],
    );
  }
}
