// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);

import 'dart:convert';

import 'package:delivery_app_getx/core/data/models/photo/photo_model.dart';
import 'package:delivery_app_getx/features/catalog/data/models/category_model.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';

ProductModel productModelFromMap(String str) =>
    ProductModel.fromMap(json.decode(str));

String productModelToMap(ProductModel data) => json.encode(data.toMap());

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.store,
    this.createdAt,
    this.updatedAt,
    this.photo,
  });

  final int id;
  final String name;
  final String description;
  final double price;
  final StoreModel store;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PhotoModel photo;

  ProductModel copyWith({
    int id,
    String name,
    String description,
    double price,
    CategoryModel category,
    StoreModel store,
    DateTime createdAt,
    DateTime updatedAt,
    PhotoModel photo,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        store: store ?? this.store,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        photo: photo ?? this.photo,
      );

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        store: json["store"] == null ? null : StoreModel.fromMap(json["store"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        photo: json["photo"] == null ? null : PhotoModel.fromMap(json["photo"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "store": store == null ? null : store.toMap(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "photo": photo == null ? null : photo.toMap(),
      };
}
