import 'dart:convert';

import 'package:delivery_app_getx/core/data/models/address_model.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';
import 'package:delivery_app_getx/features/order/data/models/cart_item_model.dart';
import 'package:delivery_app_getx/features/order/data/models/payment_type_model.dart';
import 'package:delivery_app_getx/features/user/data/models/user_model.dart';

CartModel cartModelFromMap(String str) => CartModel.fromMap(json.decode(str));

String cartModelToMap(CartModel data) => json.encode(data.toMap());

class CartModel {
  CartModel(
      {this.id,
      this.store,
      this.status,
      this.comments,
      this.paymentType,
      this.items,
      this.delivery = true,
      this.address,
      this.deliveryFee});

  int id;
  StoreModel store;
  String status;
  String comments;
  PaymentTypeModel paymentType;
  List<CartItemModel> items;
  bool delivery;
  AddressModel address;
  double deliveryFee;

  CartModel copyWith({
    int id,
    StoreModel store,
    String status,
    int price,
    UserModel user,
    String comments,
    DateTime createdAt,
    DateTime updatedAt,
    PaymentTypeModel paymentType,
    List<CartItemModel> items,
    bool delivery,
    AddressModel address,
    double deliveryFee,
  }) =>
      CartModel(
          id: id ?? this.id,
          store: store ?? this.store,
          status: status ?? this.status,
          comments: comments ?? this.comments,
          paymentType: paymentType ?? this.paymentType,
          items: items ?? this.items,
          delivery: delivery ?? this.delivery,
          address: address ?? this.address,
          deliveryFee: deliveryFee ?? this.deliveryFee);

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        store: json["store"] == null ? null : StoreModel.fromMap(json["store"]),
        status: json["Status"] == null ? null : json["Status"],
        comments: json["comments"] == null ? null : json["comments"],
        paymentType: json["payment_type"] == null
            ? null
            : PaymentTypeModel.fromMap(json["payment_type"]),
        delivery: json["delivery"] == null ? null : json["delivery"],
        address: json["address"] == null
            ? null
            : AddressModel.fromMap(json["address"]),
        deliveryFee: json["deliveryFee"] == null ? null : json["deliveryFee"],
        items: json["order_items"] == null
            ? null
            : List<CartItemModel>.from(
                json["order_items"].map((x) => CartItemModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "store": store == null ? null : store.toMapOnlyStore(),
        "comments": comments == null ? null : comments,
        "payment_type": paymentType == null ? null : paymentType.toMap(),
        "order_items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toMap())),
        "delivery": delivery == null ? null : delivery,
        "address": address == null ? null : address.toMap(),
        "deliveryFee": deliveryFee == null ? null : deliveryFee
      };
}
