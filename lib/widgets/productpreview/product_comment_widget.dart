import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/constans/method_static.dart';
import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/widgets/my_button.dart';
import 'package:educationsite/widgets/my_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
class ProductCommentWidget extends GetView<HomeController> {
  const ProductCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      // height: Get.height,

      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {

                // controller.previewProduct(controller.productOne.value.id!);
                StaticMethodes.bottomSheetCheckout();

                // onTappedAddComment = false;
                // onTappedComment = true;

              },
              child: Text(
                ' برای مشاهده نظرات کاربران کلیک کنید .',
                style: kHeaderText.copyWith(
                    fontSize: 20, color: kBlueColor),
              ),
            ),
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
    );
  }
}
