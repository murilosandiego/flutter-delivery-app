import 'package:flutter/material.dart';
import 'package:delivery_app_getx/features/order/data/models/order_item_model.dart';

class OrderItemTile extends StatelessWidget {
  final OrderItemModel orderItemModel;

  const OrderItemTile({Key key, this.orderItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '${orderItemModel.quantity}X',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8),
          Text(
            '${orderItemModel.productName}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('R\$ ${orderItemModel.price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
