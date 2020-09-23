import 'dart:convert' as convert;

import 'package:get_storage/get_storage.dart';

abstract class LocalStorage {
  write(String key, dynamic json);
  read<S>(String key, {S Function(Map) construct});
  remove(String key);
  removeAll();
}

class LocalStorageImpl implements LocalStorage {
  GetStorage storage;

  LocalStorageImpl() {
    _init();
  }

  _init() {
    storage = GetStorage();
  }

  @override
  write(String key, dynamic value) {
    storage.write(key, convert.jsonEncode(value));
  }

  @override
  read<S>(String key, {S Function(Map) construct}) {
    String value = storage.read(key);

    if (value == null) return;

    if (construct == null) return convert.jsonDecode(value);
    Map<String, dynamic> json = convert.jsonDecode(value);
    return construct(json);
  }

  @override
  remove(String key) {
    storage.remove(key);
  }

  @override
  removeAll() {
    throw UnimplementedError();
  }
}
