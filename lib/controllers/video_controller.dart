
import 'package:chewie/chewie.dart';
import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/models/product_video.dart';
import 'package:educationsite/services/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  final ProductVideo video = Get.arguments;
  RxDouble opacity = 0.0.obs;
  // ScrollController scrollController = ScrollController();
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     initializedPlayer();
    // scrollController.addListener(() {
    //   if (scrollController.offset > 460) {
    //     opacity.value = 1;
    //   } else {
    //     opacity.value = 0;
    //   }
    // });
  }

  @override
  onClose(){
    super.onClose();
    videoPlayerController.dispose();
    chewieController!.dispose();

  }

  Future<void> initializedPlayer() async {
    print('Video');
    print('${locallhost}/video/${video.video}');

     videoPlayerController =
         VideoPlayerController.networkUrl(Uri.parse('${locallhost}/video/${video.video}'));
      // VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
     // VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');

    await Future.wait([
      videoPlayerController.initialize(),
    ]);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      autoInitialize: true,
      allowFullScreen: false,
      materialProgressColors: ChewieProgressColors(
        backgroundColor: Colors.grey,
        bufferedColor: Colors.grey.shade200,
        playedColor: kLightYellowColor,
      ),
    );
    Get.toNamed(AppRouts.videoScreen, arguments: video);
    update();

  }
}
