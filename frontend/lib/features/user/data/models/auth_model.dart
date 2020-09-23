import 'package:delivery_app_getx/features/user/data/models/user_model.dart';

class AppModel {
  AppModel({
    this.jwt,
    this.user,
  });

  final String jwt;
  final UserModel user;

  AppModel copyWith({
    String jwt,
    UserModel user,
  }) =>
      AppModel(
        jwt: jwt ?? this.jwt,
        user: user ?? this.user,
      );

  factory AppModel.fromMap(Map<String, dynamic> json) => AppModel(
        jwt: json["jwt"] as String,
        user: UserModel.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "jwt": jwt,
        "user": user.toMap(),
      };

  @override
  String toString() => 'App(jwt: $jwt, user: $user)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppModel && o.jwt == jwt && o.user == user;
  }

  @override
  int get hashCode => jwt.hashCode ^ user.hashCode;
}
