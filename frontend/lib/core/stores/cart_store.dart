import 'package:get/get.dart';
import 'package:delivery_app_getx/core/data/models/address_model.dart';
import 'package:delivery_app_getx/core/exceptions/app_exception.dart';
import 'package:delivery_app_getx/core/services/local_storage_get.dart';
import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';
import 'package:delivery_app_getx/features/order/data/models/cart_item_model.dart';
import 'package:delivery_app_getx/features/order/data/models/cart_model.dart';
import 'package:delivery_app_getx/features/order/data/models/payment_type_model.dart';

class CartStore extends GetxController {
  CartStore(this._storage);

  static CartStore get to => Get.find();
  static const String CART = 'CART';

  final LocalStorage _storage;

  final cart = Rx<CartModel>();

  @override
  void onInit() {
    super.onInit();
    // _storage.remove(CART);
    cart.value =
        _storage.read(CART, construct: (map) => CartModel.fromMap(map));
  }

  void addProduct(StoreModel store, CartItemModel cartItem) {
    if (cart.value.isNullOrBlank) {
      List<CartItemModel> items = List<CartItemModel>()..add(cartItem);

      final address = _getDefaultUserAddress();

      cart(CartModel(
          store: store,
          items: items,
          address: address,
          deliveryFee: store.deliveryFee));
      storageCart(cart());
      return;
    }

    if (store != cart.value.store) {
      throw AppException('items_other_store');
    }

    final index = cart.value.items
        ?.indexWhere((element) => element.product.id == cartItem.product.id);

    if (index >= 0) {
      final element = cart.value.items
          .firstWhere((element) => element.product.id == cartItem.product.id);

      element.quantity = cartItem.quantity;
    } else {
      cart.value.items.add(cartItem);
    }
    storageCart(cart());
  }

  void addQuantity(CartItemModel cartItem) {
    cartItem.incrementQuantity();
    storageCart(cart());
  }

  void removeQuantity(CartItemModel cartItem) {
    cartItem.decrementQuantity();
    storageCart(cart());
  }

  void removeItemCart(CartItemModel cartItem) {
    cart.value.items
        .removeWhere((element) => element.product.id == cartItem.product.id);

    cart.update((value) {});

    if (cart.value.items.isEmpty) {
      clear();
    }
    storageCart(cart());
  }

  double get subTotal {
    double fold = cart.value.items.fold(
        0,
        (subtotal, cartItem) =>
            subtotal + cartItem.product.price * cartItem.quantity);
    storageCart(cart());

    return fold;
  }

  double get total {
    double deliveryFee = cart.value?.deliveryFee ?? 0;
    storageCart(cart());
    return deliveryFee + subTotal;
  }

  void addPaymentType(PaymentTypeModel paymentType) {
    cart.update((cart) {
      cart.paymentType = paymentType;
    });
    storageCart(cart());
  }

  void changeDelivery(bool delivery) {
    updateDeliveryFee(delivery);
    cart.update((cart) {
      cart.delivery = delivery;
    });
    storageCart(cart());
  }

  void changeDeliveryAddress(AddressModel address) {
    if (cart().address != address) {
      cart.update((cart) {
        cart.address = address;
      });
      storageCart(cart());
    }
  }

  void updateDeliveryFee(bool delivery) {
    if (delivery) {
      final deliveryFee = cart().store.deliveryFee;
      if (deliveryFee != null) {
        cart.update((value) {
          value.deliveryFee = deliveryFee;
        });
      }
    } else {
      cart.update((value) {
        value.deliveryFee = null;
      });
    }
    storageCart(cart());
  }

  void clear() {
    cart.value = null;
    _storage.remove(CART);
  }

  void storageCart(CartModel cartModel) {
    _storage.write(CART, cartModel.toMap());
  }

  AddressModel _getDefaultUserAddress() {
    final user = AuthStore.to.user;

    if (user.adresses.length == 0) return null;

    return user?.adresses[0] ?? null;
  }
}
