import 'package:get/route_manager.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/stores/auth_store.dart';
import 'package:delivery_app_getx/core/utils/urls.dart';

class GraphQLClient {
  HasuraConnect connect = HasuraConnect(
    URLs.graphql,
    localStorageDelegate: () => LocalStorageHive(),
    token: (isError) async {
      if (isError) {
        Get.offAndToNamed(Routers.login);
      }

      if (AuthStore.to.token != null) {
        return 'Bearer ${AuthStore.to.token}';
      }
      return null;
    },
  );
}
