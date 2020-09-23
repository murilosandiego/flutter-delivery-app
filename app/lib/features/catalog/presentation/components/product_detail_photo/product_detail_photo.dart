import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:delivery_app_getx/core/utils/urls.dart';
import 'package:delivery_app_getx/features/catalog/data/models/product_model.dart';

class ProductDetailPhoto extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPhoto({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: product.id,
      child: CachedNetworkImage(
        imageUrl: '${URLs.baseUrl}${product.photo.formats.thumbnail.url}',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
                bottomLeft: const Radius.circular(10),
                bottomRight: const Radius.circular(10)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
