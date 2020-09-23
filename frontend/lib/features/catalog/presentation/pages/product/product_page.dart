import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_flat_button/custom_flat_button.dart';
import 'package:delivery_app_getx/core/presentation/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:delivery_app_getx/core/presentation/components/styles.dart';
import 'package:delivery_app_getx/core/themes/colors.dart';
import 'package:delivery_app_getx/features/catalog/data/models/product_model.dart';
import 'package:delivery_app_getx/features/catalog/data/models/store_model.dart';
import 'package:delivery_app_getx/features/catalog/presentation/components/product_detail_photo/product_detail_photo.dart';
import 'package:delivery_app_getx/features/catalog/presentation/pages/product/product_controller.dart';

class ProductPage extends GetView<ProductController> {
  final Map arguments;

  ProductPage({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product = arguments?.values?.first;
    StoreModel store = arguments?.values?.last;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: BackButton(
          color: darkText,
        ),
        title: Text(product.name, style: h4),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Center(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 100, bottom: 100),
                      padding: EdgeInsets.only(
                        top: 100,
                        bottom: 50,
                        left: 16,
                        right: 16,
                      ),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(product.description, style: disabledText),
                          Text(
                            'R\$ ${product.price.toStringAsFixed(2)}',
                            style: h3,
                          ),
                          FlatButton(
                            onPressed: null,
                            child: Text(
                              store.name,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 5, bottom: 20),
                          //   child: SmoothStarRating(
                          //     allowHalfRating: false,
                          //     onRatingChanged: (v) {
                          //       setState(() {
                          //         _rating = v;
                          //       });
                          //     },
                          //     starCount: 5,
                          //     rating: _rating,
                          //     size: 27.0,
                          //     color: Colors.orange,
                          //     borderColor: Colors.orange,
                          //   ),
                          // ),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 25),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text('Quantidade', style: h6),
                                  margin: EdgeInsets.only(bottom: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 55,
                                      height: 55,
                                      child: Obx(
                                        () => OutlineButton(
                                          onPressed:
                                              controller.quantity.value == 1
                                                  ? null
                                                  : () {
                                                      controller
                                                          .decrementQuantity();
                                                    },
                                          child: Icon(
                                            Icons.remove,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Obx(
                                        () => Text(
                                          controller.quantity.value.toString(),
                                          style: h3,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 55,
                                      height: 55,
                                      child: OutlineButton(
                                        onPressed: () {
                                          controller.incrementQuantity();
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            // width: 180,
                            child: CustomTextFormField(
                              maxLines: null,
                              controller: controller.textCommentsController,
                              labelText: 'Observações',
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: 185,
                            child: CustomFlatButton(
                              child: Text('Adicionar ao carrinho'),
                              onPressed: () {
                                controller.addProduct(
                                  product,
                                  store,
                                  controller.quantity.value,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15,
                              spreadRadius: 5,
                              color: Color.fromRGBO(0, 0, 0, .05),
                            )
                          ]),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.35,
                      height: MediaQuery.of(context).size.height / 4.5,
                      child: ProductDetailPhoto(
                        product: product,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
