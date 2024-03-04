import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/controllers/video_controller.dart';
import 'package:educationsite/models/product_video.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoScreen extends GetView<VideoController> {
   VideoScreen({super.key});
  final ProductVideo video = Get.arguments;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        title: Text(
          '${controller.video.name}'.length > 31
              ?'${controller.video.name}.substring(0,31)...'
              :'${controller.video.name}',
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
      body: CustomScrollView(
        // controller: controller.scrollController,
        slivers: [
          // SliverAppBar(
          //   expandedHeight: 600,
          //   elevation: 0,
          //   title: Row(
          //     children: [
          //       Obx(
          //         () => AnimatedOpacity(
          //           duration: Duration(milliseconds: 400),
          //           opacity: controller.opacity.value,
          //           child: Text(controller.video.name!),
          //         ),
          //       ),
          //       const Spacer(),
          //       const Icon(Icons.save_alt_rounded),
          //     ],
          //   ),
          //   pinned: true,
          //   backgroundColor: kBlackColor,
          //   flexibleSpace: FlexibleSpaceBar(
          //     background: Column(
          //       children: [
          //         SizedBox(
          //           width: Get.width,
          //           height: 430,
          //           child: Stack(
          //             children: [
          //               // Positioned(
          //               //   top: 0,
          //               //   right: 0,
          //               //   left: 0,
          //               //   child: Image.asset(
          //               //     controller.video.url!,
          //               //     fit: BoxFit.cover,
          //               //     height: 400,
          //               //   ),
          //               // ),
          //               Positioned(
          //                 right: 0,
          //                 top: 0,
          //                 left: 0,
          //                 bottom: 0,
          //                 child: Container(
          //                   color: Colors.black.withOpacity(0.7),
          //                 ),
          //               ),
          //               Positioned(
          //                 bottom: 0,
          //                 right: 20,
          //                 child: Row(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     // ClipRRect(
          //                     //   borderRadius: BorderRadius.circular(10),
          //                     //   child: Image.asset(
          //                     //     controller.video.url!,
          //                     //     height: 130,
          //                     //     width: 180,
          //                     //   ),
          //                     // ),
          //                     const SizedBox(
          //                       width: 20,
          //                     ),
          //                     Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                         Text(
          //                           controller.video.name!,
          //                           style: const TextStyle(fontSize: 22),
          //                         ),
          //                         const SizedBox(
          //                           height: 20,
          //                         ),
          //                         SizedBox(
          //                           width: Get.width * 0.4,
          //                           child: Text(
          //                             controller.video.name!,
          //                             style: const TextStyle(
          //                                 fontSize: 18, color: Colors.grey),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 25, vertical: 15),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.end,
          //             children: [
          //               Container(
          //                 padding: const EdgeInsets.symmetric(
          //                   horizontal: 25,
          //                   vertical: 12,
          //                 ),
          //                 decoration: BoxDecoration(
          //                   color: Colors.green,
          //                   borderRadius: BorderRadius.circular(25),
          //                 ),
          //                 child: const Row(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     Icon(Icons.play_arrow_rounded),
          //                     Text(
          //                       'ورود و تماشا',
          //                       style: TextStyle(fontSize: 22),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               const SizedBox(
          //                 height: 20,
          //               ),
          //               Row(
          //                 children: [
          //                   const Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         '96% این فیلم را دوست داشتند.',
          //                         style: TextStyle(
          //                           fontSize: 16,
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         height: 10,
          //                       ),
          //                       Text(
          //                         '343 رای ثبت شد .',
          //                         style: TextStyle(
          //                             fontSize: 16, color: Colors.grey),
          //                       ),
          //                     ],
          //                   ),
          //                   const Spacer(),
          //                   IconButton(
          //                     onPressed: () {},
          //                     splashRadius: 20,
          //                     icon: const Icon(
          //                       Icons.check_circle_outline,
          //                       size: 40,
          //                     ),
          //                   ),
          //                   IconButton(
          //                     onPressed: () {},
          //                     splashRadius: 20,
          //                     icon: const Icon(
          //                       Icons.cancel_outlined,
          //                       size: 40,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               const Divider(
          //                 color: Colors.grey,
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(controller.video.name!),
                ),
               const SizedBox(height: 20,),

                GetBuilder<VideoController>(
                  init: VideoController(),
                  builder: (videoController) {
                    if (videoController.chewieController != null &&
                        videoController
                            .videoPlayerController.value.isInitialized) {
                      return AspectRatio(
                          aspectRatio: videoController
                              .videoPlayerController.value.aspectRatio,
                          child: Chewie(
                              controller: videoController.chewieController!));
                    } else {
                      return Center(
                        child: Text('لطفا صبر کنید.'),
                      );
                    }
                  },
                ),
                const SizedBox(height: 70,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
