import 'package:equatable/equatable.dart';
import 'package:delivery_app_getx/core/data/models/photo/photo_model.dart';

import 'category_model.dart';

class StoreModel extends Equatable {
  StoreModel({
    this.id,
    this.name,
    this.description,
    this.startTime,
    this.endTime,
    this.slug,
    this.deliveryFee,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.logo,
    this.cover,
  });

  final int id;
  final String name;
  final String description;
  final dynamic startTime;
  final dynamic endTime;
  final String slug;
  final double deliveryFee;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CategoryModel category;
  final PhotoModel logo;
  final PhotoModel cover;

  StoreModel copyWith({
    int id,
    String name,
    String description,
    dynamic startTime,
    dynamic endTime,
    String slug,
    int deliveryFee,
    DateTime createdAt,
    DateTime updatedAt,
    CategoryModel category,
    PhotoModel logo,
    PhotoModel cover,
  }) =>
      StoreModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        slug: slug ?? this.slug,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category ?? this.category,
        logo: logo ?? this.logo,
        cover: cover ?? this.cover,
      );

  factory StoreModel.fromMap(Map<String, dynamic> json) => StoreModel(
        id: json["id"] == null
            ? null
            : (json["id"] is String) ? int.parse(json["id"]) : json["id"],
        name: json["name"],
        description: json["description"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        slug: json["slug"],
        deliveryFee:
            json["deliveryFee"] == null ? null : json["deliveryFee"].toDouble(),
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        category: (json["category"] is int || json["category"] == null)
            ? null
            : CategoryModel.fromMap(json["category"]),
        logo: json["logo"] != null ? PhotoModel.fromMap(json["logo"]) : null,
        cover: json["cover"] != null ? PhotoModel.fromMap(json["cover"]) : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "startTime": startTime,
        "endTime": endTime,
        "slug": slug,
        "deliveryFee": deliveryFee,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "category": category == null ? null : category.toMap(),
        "logo": logo == null ? null : logo.toMap(),
        "cover": cover == null ? null : cover.toMap(),
      };

  Map<String, dynamic> toMapOnlyStore() => {
        "id": id,
        "name": name,
        "description": description,
        "startTime": startTime,
        "endTime": endTime,
        "slug": slug,
        "deliveryFee": deliveryFee,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
  @override
  List<Object> get props => [id, name];

  @override
  bool get stringify => true;
}
