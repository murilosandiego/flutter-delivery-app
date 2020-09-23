import 'package:get/get.dart';
import 'package:delivery_app_getx/features/catalog/data/models/product_model.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';
import 'package:delivery_app_getx/features/catalog/data/repositories/product_repository.dart';

class StoreDetailController extends GetxController {
  StoreDetailController(this._productRepository);
  static StoreDetailController get to => Get.find();

  final ProductRepository _productRepository;
  List<ProductModel> products;

  void getProductsByStore(StoreModel store) async {
    final params = {'store.id': store.id};
    products = await _productRepository.findAll(params: params);
    update(['g-products-list']);
  }
}
