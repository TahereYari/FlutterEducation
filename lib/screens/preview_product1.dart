import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/constans/method_static.dart';
import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/product_category.dart';
import 'package:educationsite/models/product_video.dart';
import 'package:educationsite/widgets/base_widget.dart';
import 'package:educationsite/widgets/chapter_tile.dart';
import 'package:educationsite/widgets/my_button.dart';
import 'package:educationsite/widgets/my_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class PreviewProduct extends GetView<HomeController> {
  PreviewProduct({super.key});

  bool onTappedComment = true;
  bool onTappedAddComment = false;

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        title: Text(
          '${controller.productOne.value.name}'.length > 31
          ?'${controller.productOne.value.name}.substring(0,31)...'
          :'${controller.productOne.value.name}',
          style: kHeaderText,
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
      // padding: 0,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            '${local}/image/product/${controller.productOne.value.image}',
            height: 200,
            width: Get.width,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: Get.width,
            child: Row(
              children: [
                Text(
                  'نام:',
                  style: kHeaderText.copyWith(fontSize: 23),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                 controller.productOne.value.name.toString(),
                  style: kTextStyle,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: Get.width,
            child: Row(
              children: [
                Text(
                  ' قیمت:',
                  style: kHeaderText.copyWith(fontSize: 23),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  ' ${controller.productOne.value.price.toString()} ریال ',
                  style: kTextStyle,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: Get.width,
            child: Row(
              children: [
                Text(
                  ' توضیحات :',
                  style: kHeaderText.copyWith(fontSize: 23),
                ),
                const SizedBox(
                  width: 30,
                ),
                // Expanded(
                //     child: Text(
                //        StaticMethodes.parseHtmlString(controller.productOne.value.description.toString()),
                //       style: kTextStyle,
                //     ),),
              ],
            ),
          ),
          // SizedBox(
          //   width: Get.width,
          //   height: Get.height,
          //   child: Row(
          //     children: [
          //
          //       Expanded(
          //           child: Text(
          //            controller.productOne.value.description.toString(),
          //             style: kTextStyle,
          //           )),
          //     ],
          //   ),
          // ),
          const Divider(
            thickness: 2,
          ),
          // SizedBox(
          //   height: 20,
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.productCategory.length,
              itemBuilder: (context, index) {
                ProductCategory productCategory = controller.productCategory[index];

                  // return ChapterTile(productCategory: productCategory);

                return ExpansionTile(
                  collapsedBackgroundColor: Colors.grey,

                    title: Text(productCategory.title!),
                    children: [

                      ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: StaticMethodes.getVideosForCategory(productCategory.id!).length,
                        itemBuilder: (context, index) {


                          //
                          // List<ProductVideo> productVideo = controller
                          //     .productVideo
                          //     .where((v) => v.videoCategoryId == productCategory.id)
                          //     .toList();


                          final video = StaticMethodes.getVideosForCategory(
                            productCategory.id!)[index];
                          // ProductVideo? productVideo = controller
                          //     .productVideo
                          //     .where((v) => v.videoCategoryId == productCategory.id)
                          //     .firstOrNull;
                          if(video != null){
                            return ListTile(
                              title: Text(video.name!),
                            );
                          }
                          else{

                          }


                        },
                      ),
                    ]
                );

              },
            ),
          ),
          TextButton(
            onPressed: () {
              controller.commentOfPtoduct.clear();
              // controller.previewProduct(controller.productOne.value.id!);
              StaticMethodes.bottomSheetCheckout();

              // onTappedAddComment = false;
              // onTappedComment = true;

            },
            child: Text(
              ' نظرات',
              style: kHeaderText.copyWith(
                  fontSize: 23, color: kBlueColor),
            ),
          ),
          const Divider(
            color: kRedColor,
          ),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.token == '-1'
                        ? Center(
                      child: Text(
                        'برای ثبت نظر لطفا وارد حساب کاربری خود شوید',
                        style: kTextStyle,
                      ),
                    )
                        : const SizedBox(
                      height: 10,
                    ),

                    MyTextFeild(
                      controller: controller
                          .commentController,
                      hintText: ' دیدگاه خود را در مورد این دوره وارد نمایید.',
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(
                        text: 'ثبت',
                        onTapped: () {
                          // Get.find<CommentController>().addComment(
                          //     controller.productOne.value.id!);
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
