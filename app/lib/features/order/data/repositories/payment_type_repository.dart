import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/core/utils/urls.dart';
import 'package:delivery_app_getx/features/order/data/models/payment_type_model.dart';

abstract class PaymentTypeRespository {
  Future<List<PaymentTypeModel>> findPayments();
}

class PaymentTypeRespositoryImpl implements PaymentTypeRespository {
  final HttpClient _client;

  PaymentTypeRespositoryImpl(this._client);

  @override
  Future<List<PaymentTypeModel>> findPayments() async {
    final response = await _client.get(URLs.paymentTypes);
    return (response as List).map((e) => PaymentTypeModel.fromMap(e)).toList();
  }
}
