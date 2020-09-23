import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/core/utils/urls.dart';
import 'package:delivery_app_getx/features/catalog/data/models/product_model.dart';

class DealsItem extends StatelessWidget {
  final ProductModel product;
  final double imgWidth;
  final onLike;
  final onTapped;
  final bool isProductPage = false;

  const DealsItem(this.product,
      {Key key, this.imgWidth, this.onLike, this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      margin: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[200],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 7,
            child: Hero(
              transitionOnUserGestures: true,
              tag: product.name,
              child: CachedNetworkImage(
                imageUrl:
                    '${URLs.baseUrl}${product.photo.formats.thumbnail.url}',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
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
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: foodNameText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          product.description,
                          style: disabledText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Text('R\$ ${product.price.toStringAsFixed(2)}',
                      style: priceText),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
