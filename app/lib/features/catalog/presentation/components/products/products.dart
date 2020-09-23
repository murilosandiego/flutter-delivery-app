import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';

import '../../../data/models/product_model.dart';
import 'product_tile.dart';

class Products extends StatelessWidget {
  final List<ProductModel> products;
  final StoreModel store;

  const Products({Key key, this.products, @required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final ProductModel product = products[index];
        return InkWell(
          onTap: () {
            Get.toNamed(Routers.product, arguments: {
              product: product,
              store: store,
            });
          },
          child: ProductTile(product: product),
        );
      },
      itemCount: products.length,
      separatorBuilder: (_, int index) => Divider(),
    );
  }
}
