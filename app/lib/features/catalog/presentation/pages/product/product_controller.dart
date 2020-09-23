import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/exceptions/app_exception.dart';
import '../../../../../core/routes/routers.dart';
import '../../../../../core/stores/cart_store.dart';
import '../../../../order/data/models/cart_item_model.dart';
import '../../../data/models/product_model.dart';
import '../../../data/models/store_model.dart';

class ProductController extends GetxController {
  final CartStore _cartStore;
  final quantity = 1.obs;

  TextEditingController textCommentsController = TextEditingController();

  ProductController(this._cartStore);

  void addProduct(ProductModel product, StoreModel store, int quantity) {
    final CartItemModel cartItem =
        CartItemModel(product: product, comments: textCommentsController.text);

    cartItem.quantity = quantity;
    cartItem.updatePrice();

    try {
      _cartStore.addProduct(store, cartItem);
      Get.offAndToNamed(Routers.cart);
    } on AppException catch (e) {
      if (e.message == 'items_other_store') {
        Get.defaultDialog(
            title:
                'Você tem itens de outro estabelecimento adicionado no seu carrinho',
            content: Text('Deseja limpar o carrinho?'),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  _cartStore.clear();
                  _cartStore.addProduct(store, cartItem);
                  return Get.offAndToNamed(Routers.cart);
                },
                child: Text(
                  'Sim',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              OutlineButton(
                child: Text('Não'),
                onPressed: () {
                  Get.back();
                },
              ),
            ]);
      }
    } on Exception catch (_) {
      Get.snackbar(
        'Erro',
        'Não foi possível adicionar o produto no carrinho. Tente novamente mais tarde',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }

    // catch (e) {
    //   print(e);
    // }
  }

  void incrementQuantity() {
    quantity.value++;
  }

  void decrementQuantity() {
    quantity.value--;
  }
}
