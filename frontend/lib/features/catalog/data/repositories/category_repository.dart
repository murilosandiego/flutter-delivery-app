import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/core/utils/urls.dart';
import 'package:delivery_app_getx/features/catalog/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> findAll({Map<String, dynamic> params});
  Future<CategoryModel> findById(int id);
}

class CategoryRepositoryImpl implements CategoryRepository {
  final HttpClient _client;

  CategoryRepositoryImpl(this._client);

  @override
  Future<List<CategoryModel>> findAll({Map<String, dynamic> params}) async {
    final response = await _client.get(URLs.categories);
    return (response as List)
        .map<CategoryModel>((json) => CategoryModel.fromMap(json))
        .toList();
  }

  @override
  Future<CategoryModel> findById(int id) async {
    final response = await _client.get('${URLs.categories}/$id');
    return CategoryModel.fromMapWithStore(response);
  }
}
