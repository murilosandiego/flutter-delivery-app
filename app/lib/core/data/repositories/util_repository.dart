import 'package:delivery_app_getx/core/data/models/address_model.dart';
import 'package:delivery_app_getx/core/exceptions/app_exception.dart';
import 'package:delivery_app_getx/core/services/http_client.dart';

abstract class UtilRepository {
  Future<AddressModel> findAddressByCep(String cep);
}

class UtilRepositoryImpl extends UtilRepository {
  final HttpClient _client;

  UtilRepositoryImpl(this._client);

  @override
  Future<AddressModel> findAddressByCep(String cep) async {
    final response = await _client.get('https://viacep.com.br/ws/$cep/json');

    if (response['erro'] == true) {
      throw AppException('invalid_cep');
    }

    return AddressModel(
      place: response['logradouro'],
      complement: response['complemento'],
      district: response['bairro'],
      city: response['localidade'],
      state: response['uf'],
    );
  }
}
