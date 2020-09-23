class RoleModel {
  RoleModel({
    this.id,
    this.name,
    this.description,
    this.type,
  });

  final int id;
  final String name;
  final String description;
  final String type;

  RoleModel copyWith({
    int id,
    String name,
    String description,
    String type,
  }) =>
      RoleModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        type: type ?? this.type,
      );

  factory RoleModel.fromMap(Map<String, dynamic> json) => RoleModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
      };

  @override
  String toString() {
    return 'Role(id: $id, name: $name, description: $description, type: $type)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RoleModel &&
        o.id == id &&
        o.name == name &&
        o.description == description &&
        o.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ type.hashCode;
  }
}
