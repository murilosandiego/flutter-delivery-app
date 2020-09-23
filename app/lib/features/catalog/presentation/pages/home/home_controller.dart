import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/features/catalog/data/models/category_model.dart';
import 'package:delivery_app_getx/features/catalog/data/models/product_model.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';
import 'package:delivery_app_getx/features/catalog/data/repositories/category_repository.dart';
import 'package:delivery_app_getx/features/catalog/data/repositories/product_repository.dart';
import 'package:delivery_app_getx/features/catalog/data/repositories/store_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  HomeController(
      this._categoryRepository, this._productRepository, this._storeRepository);

  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;
  final StoreRepository _storeRepository;

  List<CategoryModel> categories = List<CategoryModel>();
  List<ProductModel> products = List<ProductModel>();
  List<StoreModel> stores = List<StoreModel>();

  final appState = Rx<AppState>();

  @override
  void onInit() {
    super.onInit();
    fetchAll();
  }

  fetchAll() async {
    try {
      appState.value = AppState.LOADING;
      await getCategories();
      await getProducts();
      await getStores();
      appState.value = AppState.DONE;
    } catch (e) {
      Get.snackbar(
        ':(',
        'Um erro inesperado aconteceu',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      appState.value = AppState.ERROR;
    }
  }

  Future<void> getCategories({Map<String, dynamic> params}) async {
    try {
      categories = await _categoryRepository.findAll(params: params);
      update(['g-categories']);
    } on Exception catch (_) {}
  }

  Future<void> getProducts({Map<String, dynamic> params}) async {
    // try {
    products = await _productRepository.findAll(params: params);
    update(['g-deals']);
    // } catch (e) {
    //   print('ERROOO >>> $e');
    // }
  }

  Future<void> getStores({Map<String, dynamic> params}) async {
    // try {
    stores = await _storeRepository.findAll(params: params);
    update(['g-stores']);
    // } catch (e) {
    //   print('ERROOO >>> $e');
    // }
  }
}
