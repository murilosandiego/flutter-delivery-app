import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final Function onPressed;
  final String url;

  const CategoryItem({
    Key key,
    this.name,
    this.onPressed,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: onPressed,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 80,
              height: 80,
              child: CachedNetworkImage(
                imageUrl: url,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
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
          Text(name, style: categoryText)
        ],
      ),
    );
  }
}
