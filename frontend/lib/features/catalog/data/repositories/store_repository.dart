import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/core/utils/urls.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';

abstract class StoreRepository {
  Future<List<StoreModel>> findAll({Map<String, dynamic> params});
}

class StoreRepositoryImpl implements StoreRepository {
  final HttpClient _client;

  StoreRepositoryImpl(this._client);

  @override
  Future<List<StoreModel>> findAll({Map<String, dynamic> params}) async {
    final response = await _client.get(URLs.stores, queryParameters: params);
    return (response as List)
        .map<StoreModel>((json) => StoreModel.fromMap(json))
        .toList();
  }
}
