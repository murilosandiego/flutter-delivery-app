import 'package:delivery_app_getx/core/data/models/photo/photo_model.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';

class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.description,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.photo,
    this.stores,
  });

  final int id;
  final String name;
  final dynamic description;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PhotoModel photo;
  final List<StoreModel> stores;

  CategoryModel copyWith({
    int id,
    String name,
    dynamic description,
    String slug,
    DateTime createdAt,
    DateTime updatedAt,
    PhotoModel photo,
    List<StoreModel> stores,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        slug: slug ?? this.slug,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        photo: photo ?? this.photo,
        stores: stores ?? this.stores,
      );

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        photo: PhotoModel.fromMap(json["photo"]),
        // stores: List<StoreModel>.from(
        //     json["stores"].map((x) => StoreModel.fromMap(x))),
      );

  factory CategoryModel.fromMapWithStore(Map<String, dynamic> json) =>
      CategoryModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        photo: PhotoModel.fromMap(json["photo"]),
        stores: List<StoreModel>.from(
          json["stores"].map((x) => StoreModel.fromMap(x)),
        ),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "photo": photo.toMap(),
        "stores": List<dynamic>.from(stores.map((x) => x.toMap())),
      };
}
