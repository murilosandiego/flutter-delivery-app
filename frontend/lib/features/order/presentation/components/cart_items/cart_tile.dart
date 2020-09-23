import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_text_form_field/custom_text_form_field.dart';

import '../../../../../core/presentation/components/styles.dart';
import '../../../../../core/stores/cart_store.dart';
import '../../../data/models/cart_item_model.dart';

class CartTile extends GetView<CartStore> {
  final CartItemModel cartItem;

  CartTile(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        onTap: () => getBottomSheet(),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${cartItem.quantity}X',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Text(
              '${cartItem.product.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('R\$ ${cartItem.price.toStringAsFixed(2)}'),
            IconButton(
              onPressed: () => getBottomSheet(),
              icon: Icon(Icons.more_vert),
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }

  Future getBottomSheet() {
    return Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Wrap(
          children: <Widget>[
            ListTile(
              title: Text(
                '${cartItem.product.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: h4,
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              // leading: Icon(Icons.music_note),
              title:
                  // Obx(
                  //   () =>

                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 55,
                    height: 55,
                    child: OutlineButton(
                      onPressed: () {
                        controller.removeQuantity(cartItem);
                      },
                      child: Icon(
                        Icons.remove,
                        color: Get.theme.primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Obx(
                      () => Text(
                        '${cartItem.quantity}',
                        style: h4,
                      ),
                    ),
                  ),
                  Container(
                    width: 55,
                    height: 55,
                    child: OutlineButton(
                      onPressed: () {
                        controller.addQuantity(cartItem);
                      },
                      child: Icon(
                        Icons.add,
                        color: Get.theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              // ),
            ),
            ListTile(
              title: Text(
                'Adicionar observação',
                textAlign: TextAlign.center,
              ),
              onTap: () => getCommentDialog(),
            ),
            ListTile(
              title: Text(
                'Remover item',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Get.back();
                controller.removeItemCart(cartItem);
              },
            ),
          ],
        ),
      ),
    );
  }

  getCommentDialog() {
    return Get.defaultDialog(
      title: 'Adicionar observação',
      content: Container(
        margin: EdgeInsets.all(16),
        child: CustomTextFormField(
          initialValue: cartItem.comments,
          onChanged: (text) {
            cartItem.comments = text;
          },
          maxLines: 10,
          labelText: 'Observações',
        ),
      ),
      actions: <Widget>[
        RaisedButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
