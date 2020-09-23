import 'package:delivery_app_getx/core/services/gql_client.dart';
import 'package:delivery_app_getx/core/services/http_client.dart';
import 'package:delivery_app_getx/core/utils/urls.dart';
import 'package:delivery_app_getx/features/order/data/documents/docs_gql.dart';
import 'package:delivery_app_getx/features/order/data/models/order_model.dart';

abstract class OrderRespository {
  Future<bool> createOrder(Map<String, dynamic> body);
  Future<List<OrderModel>> getOrdersByUser({int userId});
  Future<OrderModel> getOrder(int orderId);
}

class OrderRespositoryImpl implements OrderRespository {
  final HttpClient _client;
  final GraphQLClient _gqlClient;

  OrderRespositoryImpl(this._client, this._gqlClient);

  @override
  Future<bool> createOrder(Map<String, dynamic> body) async {
    try {
      await _client.post(URLs.orders, body: body, authorization: true);
      return true;
    } on Exception catch (e) {
      throw e;
    }
  }

  @override
  Future<List<OrderModel>> getOrdersByUser({int userId}) async {
    final response = await _gqlClient.connect
        .query(DocsGql.getOrders, variables: {'id': userId});

    return (response['data']['orders'] as List)
        .map((json) => OrderModel.fromMap(json))
        .toList();
  }

  @override
  Future<OrderModel> getOrder(int orderId) async {
    final response = await _gqlClient.connect
        .query(DocsGql.getOrder, variables: {'id': orderId});

    return OrderModel.fromMap(response['data']['order']);
  }
}
