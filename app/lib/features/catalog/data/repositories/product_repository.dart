import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/core/utils/urls.dart';
import 'package:delivery_app_getx/features/catalog/data/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> findAll({Map<String, dynamic> params});
}

class ProductRepositoryImpl implements ProductRepository {
  final HttpClient _client;

  ProductRepositoryImpl(this._client);

  @override
  Future<List<ProductModel>> findAll({Map<String, dynamic> params}) async {
    final response = await _client.get(URLs.products);
    return (response as List)
        .map<ProductModel>((json) => ProductModel.fromMap(json))
        .toList();
  }
}
