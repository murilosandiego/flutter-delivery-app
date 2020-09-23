import 'dart:convert';

import 'package:get/get.dart';

import '../../../catalog/data/models/product_model.dart';

class CartItemModel {
  ProductModel product;
  double price;
  String comments;
  int quantityInit;

  CartItemModel({this.product, this.price, this.comments, this.quantityInit}) {
    quantity = quantityInit;
  }

  final _quantityObs = 1.obs;

  set quantity(int value) {
    _quantityObs.value = value;
  }

  int get quantity => _quantityObs.value;

  incrementQuantity() {
    this.quantity += 1;
    updatePrice();
  }

  decrementQuantity() {
    if (this.quantity <= 1) {
      this.quantity = 1;
    } else {
      this.quantity -= 1;
    }
    updatePrice();
  }

  updatePrice() {
    price = product.price * quantity;
  }

  CartItemModel copyWith({
    ProductModel product,
    double price,
    String comments,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      price: price ?? this.price,
      comments: comments ?? this.comments,
    );
  }

  @override
  String toString() =>
      'CartItemModel(product: $product, price: $price, comments: $comments)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CartItemModel &&
        o.product == product &&
        o.price == price &&
        o.comments == comments;
  }

  @override
  int get hashCode => product.hashCode ^ price.hashCode ^ comments.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'product': product?.toMap(),
      'price': price,
      'comments': comments,
      'quantity': quantity
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CartItemModel(
        product: ProductModel.fromMap(map['product']),
        price: map['price'],
        comments: map['comments'],
        quantityInit: map['quantity']);
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source));
}
