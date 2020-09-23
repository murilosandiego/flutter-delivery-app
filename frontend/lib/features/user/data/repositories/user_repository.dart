import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/core/utils/urls.dart';
import 'package:delivery_app_getx/features/user/data/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> updateUser(UserModel user);
}

class UserRepositoryImpl extends UserRepository {
  final HttpClient _client;

  UserRepositoryImpl(this._client);

  @override
  Future<UserModel> updateUser(UserModel user) async {
    final response = await _client.put('${URLs.users}/${user.id}',
        body: user.toMap(), authorization: true);

    return UserModel.fromMap(response);
  }
}
