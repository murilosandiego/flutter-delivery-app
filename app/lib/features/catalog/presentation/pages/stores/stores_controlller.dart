import 'package:get/get.dart';
import 'package:delivery_app_getx/features/catalog/data/models/category_model.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';
import 'package:delivery_app_getx/features/catalog/data/repositories/store_repository.dart';

class StoresController extends GetxController {
  static StoresController get to => Get.find();
  final StoreRepository _storeRepository;

  List<StoreModel> stores;

  StoresController(this._storeRepository);

  void getStoresByCategory(CategoryModel category) async {
    final params = {'category.id': category.id};

    stores = await _storeRepository.findAll(params: params);
    update(['g-stores-list']);
  }
}
