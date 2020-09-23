import 'package:flutter/material.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/features/order/data/models/order_item_model.dart';
import 'package:delivery_app_getx/features/order/data/models/order_model.dart';
import 'package:delivery_app_getx/features/order/presentation/components/order_item/order_item_tile.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  const OrderTile({Key key, this.order})
      : assert(order != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            order.store.name,
            style: h5,
          ),
          Text(
            '${order.createdAt}',
            style: disabledText,
          ),
          Text(
            'Pedido nº ${order.id}',
            style: disabledText,
          ),
          Divider(),
          Text(
            'Pedido ${order.orderStatus.name.toLowerCase()}',
            style: h6,
          ),
          Text(
            order.orderStatus.description,
            style: disabledText,
          ),
          Divider(),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: order.orderItems.length,
            itemBuilder: (_, index) {
              final OrderItemModel orderItemModel = order.orderItems[index];
              return OrderItemTile(orderItemModel: orderItemModel);
            },
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Subtotal',
              style: disabledText,
            ),
            trailing: Text(
              'R\$ ${order.subtotal.toStringAsFixed(2)}',
              style: disabledText,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Taxa de entrega',
              style: disabledText,
            ),
            trailing: order.deliveryFee == null
                ? Text(
                    'Grátis',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : Text(
                    'R\$ ${order.deliveryFee.toStringAsFixed(2)}',
                    style: disabledText,
                  ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Total',
              style: h4,
            ),
            trailing: Text(
              'R\$ ${order.total.toStringAsFixed(2)}',
              style: h4,
            ),
          ),
        ],
      ),
    );
  }
}
