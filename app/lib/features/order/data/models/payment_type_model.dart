// To parse this JSON data, do
//
//     final paymentType = paymentTypeFromMap(jsonString);

import 'dart:convert';

PaymentTypeModel paymentTypeFromMap(String str) =>
    PaymentTypeModel.fromMap(json.decode(str));

String paymentTypeToMap(PaymentTypeModel data) => json.encode(data.toMap());

class PaymentTypeModel {
  static const app = 'App';
  static const store = 'Store';

  PaymentTypeModel({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.receive,
  });

  final int id;
  final String name;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String receive;

  PaymentTypeModel copyWith({
    int id,
    String name,
    String slug,
    DateTime createdAt,
    DateTime updatedAt,
    String receive,
  }) =>
      PaymentTypeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        receive: receive ?? this.receive,
      );

  factory PaymentTypeModel.fromMap(Map<String, dynamic> json) =>
      PaymentTypeModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        receive: json["receive"] == null ? null : json["receive"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "receive": receive == null ? null : receive,
      };
}
