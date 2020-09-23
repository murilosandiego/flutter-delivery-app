import 'package:delivery_app_getx/features/user/data/models/user_model.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';
import 'package:delivery_app_getx/features/order/data/models/order_item_model.dart';
import 'package:delivery_app_getx/features/order/data/models/order_status_model.dart';
import 'package:delivery_app_getx/features/order/data/models/payment_type_model.dart';

class OrderModel {
  OrderModel({
    this.id,
    this.store,
    this.user,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.paymentType,
    this.deliveryFee,
    this.total,
    this.subtotal,
    this.orderStatus,
    this.orderItems,
  });

  final int id;
  final StoreModel store;
  final UserModel user;
  final dynamic comments;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PaymentTypeModel paymentType;
  final double deliveryFee;
  final double total;
  final double subtotal;
  final OrderStatusModel orderStatus;
  final List<OrderItemModel> orderItems;

  OrderModel copyWith({
    int id,
    StoreModel store,
    UserModel user,
    dynamic comments,
    DateTime createdAt,
    DateTime updatedAt,
    PaymentTypeModel paymentType,
    int deliveryFee,
    double total,
    double subtotal,
    OrderStatusModel orderStatus,
    List<OrderItemModel> orderItems,
  }) =>
      OrderModel(
        id: id ?? this.id,
        store: store ?? this.store,
        user: user ?? this.user,
        comments: comments ?? this.comments,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        paymentType: paymentType ?? this.paymentType,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        total: total ?? this.total,
        subtotal: subtotal ?? this.subtotal,
        orderStatus: orderStatus ?? this.orderStatus,
        orderItems: orderItems ?? this.orderItems,
      );

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        id: json["id"] == null
            ? null
            : (json["id"] is String) ? int.parse(json["id"]) : json["id"],
        store: json["store"] == null ? null : StoreModel.fromMap(json["store"]),
        user: json["user"] == null ? null : UserModel.fromMap(json["user"]),
        comments: json["comments"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        paymentType: json["payment_type"] == null
            ? null
            : PaymentTypeModel.fromMap(json["payment_type"]),
        deliveryFee:
            json["deliveryFee"] == null ? null : json["deliveryFee"].toDouble(),
        total: json["total"] == null ? null : json["total"].toDouble(),
        subtotal: json["subtotal"] == null ? null : json["subtotal"].toDouble(),
        orderStatus: json["order_status"] == null
            ? null
            : OrderStatusModel.fromMap(json["order_status"]),
        orderItems: json["order_items"] == null
            ? null
            : List<OrderItemModel>.from(
                json["order_items"].map((x) => OrderItemModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "store": store == null ? null : store.toMap(),
        "user": user == null ? null : user.toMap(),
        "comments": comments,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "payment_type": paymentType == null ? null : paymentType.toMap(),
        "deliveryFee": deliveryFee == null ? null : deliveryFee,
        "total": total == null ? null : total,
        "subtotal": subtotal == null ? null : subtotal,
        "order_status": orderStatus == null ? null : orderStatus.toMap(),
        "order_items": orderItems == null
            ? null
            : List<dynamic>.from(orderItems.map((x) => x.toMap())),
      };
}
