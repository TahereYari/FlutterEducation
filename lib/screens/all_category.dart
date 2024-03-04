import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/category.dart';
import 'package:educationsite/widgets/base_widget.dart';
import 'package:educationsite/widgets/widget_loading.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans/constans.dart';

class AllCategoryScreen extends GetView<HomeController> {
  const AllCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BaseWidget(
        appBar: AppBar(
          backgroundColor: kMainBlueColor,
          title: Text(
            ' همه ی دسته ها',
            style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        child: Obx(() => Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                if (controller.allCategory.isEmpty) ...[
                  const Expanded(
                    child: Center(
                      child: WidgetLoading(),
                    ),
                  ),
                ] else ...[
                  Expanded(
                      child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 20.0,
                    padding: const EdgeInsets.all(8.0),

                    children: List.generate(
                      controller.allCategory.length,
                      (index) {
                        Category category = controller.allCategory[index] ;
                        // return InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     // width: Get.width,
                        //     // height: 250,
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
                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                        '${local}/image/category/${category.image}',
                                      height: 80,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                              Text(
                                                category.name!.length >30
                                                    ?'${category.name!.substring(0,30)}...'
                                                    :category.name!,
                                                style: kHeaderText.copyWith(
                                                  fontSize: 16,
                                                  color: kBlackColor,
                                                ),


                                              ),
                                                  const SizedBox(height: 10,),
                                                  // Text(
                                                  //   product!.price.toString(),
                                                  //   style: kHeaderText.copyWith(
                                                  //     fontSize: 12,
                                                  //     color: kBlackColor,
                                                  //   )),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ))
                ],
              ],
            )),
      ),
    );
  }
}
