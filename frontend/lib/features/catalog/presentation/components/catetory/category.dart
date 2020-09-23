import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/routes/tabs_routers/home_tab_router.dart';
import 'package:delivery_app_getx/core/utils/urls.dart';
import 'package:delivery_app_getx/features/catalog/presentation/pages/home/home_controller.dart';
import 'category_item.dart';
import '../header_section/header_section.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        HeaderSection(
          headerTitle: 'Categorias',
          onViewMore: () {},
        ),
        SizedBox(
          height: 130,
          child: GetBuilder<HomeController>(
            id: 'g-categories',
            builder: (_) => ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: _.categories
                  .map<Widget>((c) => CategoryItem(
                        name: c.name,
                        onPressed: () {
                          Get.toNamed(
                            Routers.storesByCategory,
                            id: HomeTabRouter.navigatorIndex,
                            arguments: c,
                          );
                        },
                        url: '${URLs.baseUrl}${c.photo.formats.thumbnail.url}',
                      ))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
