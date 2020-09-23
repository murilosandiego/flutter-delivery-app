import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/fryo_icons.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/core/routes/routers.dart';
import 'package:delivery_app_getx/core/routes/tabs_routers/home_tab_router.dart';
import 'package:delivery_app_getx/core/routes/tabs_routers/orders_tab_router.dart';
import 'package:delivery_app_getx/core/routes/tabs_routers/profile_tab_router.dart';
import 'package:delivery_app_getx/core/stores/cart_store.dart';

class BasePage extends StatefulWidget {
  final String pageTitle;

  BasePage({Key key, this.pageTitle}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<BasePage> {
  final pageViewController = PageController();

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        children: <Widget>[
          HomeTabRouter(),
          Text('Tab2'),
          OrdersTabRouter(),
          ProfileTabRouter(),
        ],
      ),
      floatingActionButton: Obx(
        () => CartStore.to.cart() != null
            ? FloatingActionButton(
                onPressed: () => Get.toNamed(Routers.cart),
                child: Icon(
                  Fryo.cart,
                ),
              )
            : Container(),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageViewController,
        builder: (_, __) {
          return BottomNavigationBar(
            currentIndex: pageViewController?.page?.round() ?? 0,
            onTap: (page) {
              pageViewController.jumpToPage(page);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Fryo.shop),
                  title: Text(
                    'Home',
                    style: tabLinkStyle,
                  )),
              BottomNavigationBarItem(
                icon: Icon(Fryo.search),
                title: Text(
                  'Busca',
                  style: tabLinkStyle,
                ),
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Fryo.cart),
              //   title: Text(
              //     'Carrinho: ' + CartStore.to.productsCart.length.toString(),
              //     style: tabLinkStyle,
              //   ),
              // ),
              BottomNavigationBarItem(
                icon: Icon(Fryo.list),
                title: Text(
                  'Pedidos',
                  style: tabLinkStyle,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Fryo.user_1),
                title: Text(
                  'Perfil',
                  style: tabLinkStyle,
                ),
              ),
            ],
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.green[600],
          );
        },
      ),
    );
  }
}
