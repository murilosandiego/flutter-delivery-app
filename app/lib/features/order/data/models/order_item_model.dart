import 'package:delivery_app_getx/features/catalog/data/models/product_model.dart';

class OrderItemModel {
  OrderItemModel(
      {this.id,
      this.product,
      this.quantity,
      this.price,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.priceUnit,
      this.productName});

  final int id;
  final ProductModel product;
  final int quantity;
  final double price;
  final String comments;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double priceUnit;
  final String productName;

  OrderItemModel copyWith(
          {int id,
          ProductModel product,
          int quantity,
          int price,
          String comments,
          DateTime createdAt,
          DateTime updatedAt,
          int priceUnit,
          String productName}) =>
      OrderItemModel(
          id: id ?? this.id,
          product: product ?? this.product,
          quantity: quantity ?? this.quantity,
          price: price ?? this.price,
          comments: comments ?? this.comments,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          priceUnit: priceUnit ?? this.priceUnit,
          productName: productName ?? this.productName);

  factory OrderItemModel.fromMap(Map<String, dynamic> json) => OrderItemModel(
        id: json["id"] == null ? null : json["id"],
        product: json["product"] == null
            ? null
            : ProductModel.fromMap(json["product"]),
        quantity: json["quantity"] == null ? null : json["quantity"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        comments: json["comments"] == null ? null : json["comments"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        priceUnit: json["price_unit"] == null ? null : json["price_unit"],
        productName: json["product_name"] == null ? null : json["product_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "product": product == null ? null : product.toMap(),
        "quantity": quantity == null ? null : quantity,
        "price": price == null ? null : price,
        "comments": comments == null ? null : comments,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "price_unit": priceUnit == null ? null : priceUnit,
        "product_name": productName == null ? null : productName,
      };
}
