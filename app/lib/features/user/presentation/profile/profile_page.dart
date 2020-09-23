import 'package:delivery_app_getx/core/utils/app_state.dart';
import 'package:delivery_app_getx/features/user/presentation/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:delivery_app_getx/core/presentation/components/fryo_icons.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/routes/tabs_routers/profile_tab_router.dart';
import 'package:delivery_app_getx/features/user/presentation/components/item_proflie_tile/item_profile_tile.dart';
import 'package:delivery_app_getx/features/user/presentation/components/profile_tile/profile_tile.dart';
import 'package:get/state_manager.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (controller.appState() == AppState.LOADING) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                ProfileTile(
                  onTap: () => Get.toNamed(
                    Routers.profileDetail,
                    id: ProfileTabRouter.navigatorIndex,
                  ),
                  fontWeight: FontWeight.bold,
                ),
                Divider(),
                ItemProfileTile(
                  icon: Fryo.location,
                  name: 'Endereços',
                  description: 'Meus endereços de entrega',
                  onTap: () => Get.toNamed(
                    Routers.addreses,
                  ),
                ),
                ItemProfileTile(
                  icon: Fryo.exit,
                  name: 'Sair',
                  description: 'Volte sempre!',
                  onTap: () => controller.logout(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
