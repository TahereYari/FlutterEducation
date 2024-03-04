import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/constans/method_static.dart';
import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/models/product_category.dart';
import 'package:educationsite/services/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TitleProductWidget extends GetView<HomeController> {
   TitleProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0 , right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(' عناوین ' , style: kTextStyle,),
              Text('  ${controller.productVideosCounts.value.toString()} درس ' , style: kTextStyle,),

            ],
          ),
        ),

        SizedBox(
          height: Get.height,
          child:  Obx(
              ()=> ListView.builder(
                  // padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.productCategory.length,
                  itemBuilder: (context, index) {
                    ProductCategory productCategory = controller.productCategory[index];

                    // return ChapterTile(productCategory: productCategory);

                    return Card(

                      child: ExpansionTile(
                          collapsedBackgroundColor: Color.fromRGBO(
                              229, 227, 227, 1.0),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0), // تغییر شکل به گوشه‌های گرد
                        ),
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

                                if(video != null){
                                  return ListTile(
                                    title: Text(video.name! ),

                                    trailing:
                                        controller.productOne.value.free ==1 || controller.isSale.value == true
                                      ?
                                            IconButton(onPressed: (){

                                              Get.toNamed(AppRouts.videoScreen, arguments: video);
                                            }, icon: Icon(Icons.lock_open_rounded))
                                            : Icon(Icons.lock_outline_rounded) ,
                                  );
                                }
                                else{

                                }


                              },
                            ),
                          ],


                      ),

                    );

                  },
                ),
          ),

        ),
      ],
    ) ;
  }
}
