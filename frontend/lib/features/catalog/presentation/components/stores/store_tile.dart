import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/routers.dart';
import '../../../../../core/routes/tabs_routers/home_tab_router.dart';
import '../../../../../core/utils/urls.dart';
import '../../../data/models/store_model.dart';

class StoreTile extends StatelessWidget {
  final StoreModel store;

  const StoreTile({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 9,
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(
            Routers.storeDetail,
            arguments: store,
            id: HomeTabRouter.navigatorIndex,
          );
        },
        child: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(left: 32),
              child: CachedNetworkImage(
                imageUrl: '${URLs.baseUrl}${store.logo.formats.thumbnail.url}',
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
            SizedBox(
              width: 32,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      store.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                    ),
                    Text(
                      store.category.name,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: store.deliveryFee != null,
                  replacement: Text(
                    'Gratis',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  child: Text('R\$ ${store.deliveryFee?.toStringAsFixed(2)}'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
