import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/core/utils/urls.dart';
import 'package:delivery_app_getx/features/catalog/presentation/components/deals/deals.dart';
import 'package:delivery_app_getx/features/catalog/presentation/components/products/products.dart';

import '../../../data/models/store_model.dart';
import 'store_detail_controller.dart';

class StoreDetailPage extends GetView<StoreDetailController> {
  final StoreModel store;

  StoreDetailPage({@required this.store}) : assert(store != null);

  @override
  Widget build(BuildContext context) {
    var top = 0.0;

    String coverUrl = store.cover?.formats?.thumbnail?.url ??
        store.logo.formats.thumbnail.url;

    return Scaffold(
      // backgroundColor: bgColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
          SliverAppBar(
              expandedHeight: 120,
              pinned: true,
              elevation: 1,
              floating: true,
              centerTitle: true,
              forceElevated: innerBoxIsScrolled,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    title: AnimatedOpacity(
                      opacity: top < 90 ? 1 : 0,
                      duration: Duration(milliseconds: 300),
                      child: Text(
                        store.name,
                        style: h4,
                      ),
                    ),
                    centerTitle: true,
                    background: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: '${URLs.baseUrl}$coverUrl',
                    ),
                  );
                },
              )),
        ],
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    store.name,
                    style: h4,
                  ),
                  Text(
                    store.category.name,
                    style: disabledText,
                  ),
                  Row(
                    children: <Widget>[
                      Text('Taxa de entrega: '),
                      store.deliveryFee == null
                          ? Text(
                              'Grátis',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          : Text(
                              'R\$ ${store.deliveryFee.toStringAsFixed(2)}',
                            ),
                    ],
                  ),
                ],
              ),
            ),
            GetBuilder<StoreDetailController>(
              initState: (_) => controller.getProductsByStore(store),
              id: 'g-products-list',
              builder: ($) => Deals(
                products: $.products,
                headerTitle: 'Destaques',
              ),
            ),
            Divider(),
            GetBuilder<StoreDetailController>(
              initState: (_) => controller.getProductsByStore(store),
              id: 'g-products-list',
              builder: ($) {
                if ($.products == null) {
                  return Container();
                }
                return Products(
                  products: $.products,
                  store: store,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
