import 'package:flutter/material.dart';

import '../../../data/models/product_model.dart';
import '../header_section/header_section.dart';
import 'deals_item.dart';

class Deals extends StatelessWidget {
  final List<ProductModel> products;
  final String headerTitle;

  const Deals({
    Key key,
    this.products,
    this.headerTitle = 'Promoções',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return products != null
        ? Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                HeaderSection(
                  headerTitle: headerTitle,
                  onViewMore: () {},
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: products
                        .map(
                          (product) => DealsItem(
                            product,
                            onTapped: () {},
                            onLike: () {},
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          )
        : Container();
  }
}
