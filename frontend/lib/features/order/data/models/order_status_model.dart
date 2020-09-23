class OrderStatusModel {
  OrderStatusModel({
    this.id,
    this.name,
    this.description,
    this.sequence,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String name;
  final String description;
  final int sequence;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderStatusModel copyWith({
    int id,
    String name,
    String description,
    int sequence,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      OrderStatusModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        sequence: sequence ?? this.sequence,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory OrderStatusModel.fromMap(Map<String, dynamic> json) =>
      OrderStatusModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        sequence: json["sequence"] == null ? null : json["sequence"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "sequence": sequence == null ? null : sequence,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is OrderStatusModel &&
        o.id == id &&
        o.name == name &&
        o.description == description &&
        o.sequence == sequence &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        sequence.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  @override
  String toString() {
    return 'OrderStatusModel(id: $id, name: $name, description: $description, sequence: $sequence, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
