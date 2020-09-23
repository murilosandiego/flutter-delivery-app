import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/features/user/data/models/auth_model.dart';
import 'package:delivery_app_getx/core/utils/urls.dart';

abstract class AuthRepository {
  Future<AppModel> authLocal(String identifier, String password);
  Future<AppModel> registerLocal(
    String name,
    String username,
    String email,
    String password,
  );
}

class AuthRepositoryImpl implements AuthRepository {
  final HttpClient _client;

  AuthRepositoryImpl(this._client);

  @override
  Future<AppModel> authLocal(String identifier, String password) async {
    final body = {'identifier': identifier, 'password': password};
    final response = await _client.post(URLs.authLocal, body: body);

    return AppModel.fromMap(response);
  }

  @override
  Future<AppModel> registerLocal(
    String name,
    String username,
    String email,
    String password,
  ) async {
    final body = {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };

    final response = await _client.post(URLs.registerLocal, body: body);
    return AppModel.fromMap(response);
  }
}
