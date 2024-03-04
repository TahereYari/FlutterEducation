import 'package:educationsite/controllers/basket_controller.dart';
import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/favorite.dart';
import 'package:educationsite/models/product.dart';
import 'package:educationsite/widgets/widget_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constans/constans.dart';
import '../controllers/favorite_controller.dart';

class ProductListWidget extends StatefulWidget {
   ProductListWidget({super.key, this.controller});

  final controller;



  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {

  final oCcy = NumberFormat.currency(
      locale: 'eu',
      customPattern: '#,### \u00a4',
      symbol: 'ریال',
      decimalDigits: 0);
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Column(
        children: [
          SizedBox(
            height: 10,
          ),
          if (widget.controller.isEmpty) ...[
            Expanded(
              child: Center(
                child: WidgetLoading(),
              ),
            ),
          ] else ...[
            Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  padding: EdgeInsets.all(8.0),

                  children:
                  List.generate(
                    widget.controller.length,
                        (index) {
                      Product product = widget.controller[index];
                      Favorite? favorite = Get.find<FavoriteController>()
                          .favoriteList.where(
                              (f) => f.productId == product.id).firstOrNull;

                      // return InkWell(
                      //   onTap: () {},
                      //   child: Container(
                      //     // width: Get.width,
                      //      height: 500,
                      //     decoration: BoxDecoration(
                      //         color: kLightGreenColor,
                      //         borderRadius: BorderRadius.circular(10),
                      //         border: Border.all(
                      //           color: Colors.redAccent,
                      //         )),
                      //     padding: EdgeInsets.only(
                      //       top: 10,
                      //       right: 10,
                      //       left: 10,
                      //     ),
                      //     child: SingleChildScrollView(
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Image.network(
                      //                 '${local}/image/product/${product.image}',
                      //               height: 80,
                      //               width: Get.width,
                      //               fit: BoxFit.fitWidth,
                      //             ),
                      //             SizedBox(height: 10,),
                      //             Text(
                      //               product.name!.length >30
                      //                   ?'${product.name!.substring(0,30)}...'
                      //                   :product.name!,
                      //               style: kHeaderText.copyWith(
                      //                 fontSize: 16,
                      //                 color: kBlackColor,
                      //               ),
                      //
                      //
                      //             ),
                      //             SizedBox(height: 10,),
                      //             Text(
                      //               product!.price.toString(),
                      //               style: kHeaderText.copyWith(
                      //                 fontSize: 12,
                      //                 color: kBlackColor,
                      //               ),
                      //
                      //
                      //             ),
                      //             SizedBox(height: 10,),
                      //
                      //           ],
                      //
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // );


                      return FittedBox(
                        fit: BoxFit.contain,
                        child: Card(
                          elevation: 5.0,

                          child: InkWell(
                            onTap: (){
                              // Get.find<HomeController>().commentOfPtoduct.clear();
                              Get.find<HomeController>().previewProduct(product.id!);
                            },
                            child: Container(
                              height: 500,
                              width: Get.width,
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    '${local}/image/product/${product.image}',
                                    height: 200,
                                    width: Get.width,
                                    fit: BoxFit.fill,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // product.name!.length >30
                                          //     ?'${product.name!.substring(0,30)}...'
                                          //     :
                                          product.name!,
                                          style: kHeaderText.copyWith(
                                            fontSize: 30,
                                            color: kBlackColor,
                                          ),


                                        ),
                                        SizedBox(height: 30,),
                                        Text(
                                          oCcy.format(product.price).toString()!,
                                          style: kTextStyle.copyWith(
                                              color: Colors.black,
                                              fontSize: 25
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.shopping_cart_sharp,),
                                        onPressed: () {
                                          Get.find<BasketController>()
                                              .addToBasket(product.id!);
                                        },
                                      ),
                                      IconButton(
                                        icon:
                                        favorite!=null
                                            ? Icon(Icons.favorite , color: Colors.red,)
                                            : Icon(Icons.favorite, ),
                                        onPressed: () {
                                          Get.find<FavoriteController>().addFavorite(product.id!);
                                          // Get.find<HomeController>().allProducts.clear();
                                          // Get.find<HomeController>().getAllProducts();
                                          // Get.toNamed(AppRouts.allProductScreen);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ))
          ],
        ],
      ),
    );
  }
}
