import 'package:flutter/foundation.dart';

import 'package:delivery_app_getx/core/data/models/address_model.dart';
import 'package:delivery_app_getx/features/user/data/models/role_model.dart';

class UserModel {
  UserModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.store,
      this.adresses,
      this.cpf,
      this.phone});

  final int id;
  final String name;
  final String username;
  final String email;
  final String provider;
  final bool confirmed;
  final dynamic blocked;
  final RoleModel role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic store;
  final List<AddressModel> adresses;
  final String cpf;
  final String phone;

  UserModel copyWith({
    int id,
    String name,
    String username,
    String email,
    String provider,
    bool confirmed,
    dynamic blocked,
    RoleModel role,
    DateTime createdAt,
    DateTime updatedAt,
    dynamic store,
    List<AddressModel> adresses,
    String cpf,
    String phone,
  }) =>
      UserModel(
        id: id ?? this.id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        provider: provider ?? this.provider,
        confirmed: confirmed ?? this.confirmed,
        blocked: blocked ?? this.blocked,
        role: role ?? this.role,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        store: store ?? this.store,
        adresses: adresses ?? this.adresses,
        cpf: cpf ?? this.cpf,
        phone: phone ?? this.phone,
      );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      username: json["username"],
      name: json["name"],
      email: json["email"],
      provider: json["provider"],
      confirmed: json["confirmed"],
      blocked: json["blocked"],
      role: (json["role"] is int) ? null : RoleModel.fromMap(json["role"]),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      cpf: json['cpf'],
      phone: json['phone'],
      store: json["store"],
      adresses: json["adresses"] == null
          ? null
          : List<AddressModel>.from(
              json["adresses"].map((x) => AddressModel.fromMap(x))));

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "role": role.toMap(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "store": store,
        "cpf": cpf,
        "phone": phone,
        "adresses": adresses == null
            ? null
            : List<dynamic>.from(adresses.map((x) => x.toMap())),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.id == id &&
        o.name == name &&
        o.username == username &&
        o.email == email &&
        o.provider == provider &&
        o.confirmed == confirmed &&
        o.blocked == blocked &&
        o.role == role &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.store == store &&
        o.cpf == cpf &&
        o.phone == phone &&
        listEquals(o.adresses, adresses);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        provider.hashCode ^
        confirmed.hashCode ^
        blocked.hashCode ^
        role.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        store.hashCode ^
        cpf.hashCode ^
        phone.hashCode ^
        adresses.hashCode;
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, username: $username, email: $email, provider: $provider, confirmed: $confirmed, blocked: $blocked, role: $role, createdAt: $createdAt, updatedAt: $updatedAt, store: $store, adresses: $adresses, cpf: $cpf, phone: $phone)';
  }
}
