import 'package:educationsite/controllers/basket_controller.dart';
import 'package:educationsite/controllers/favorite_controller.dart';
import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/controllers/search_controller.dart';
import 'package:educationsite/controllers/splash_controller.dart';
import 'package:educationsite/controllers/ticket_controller.dart';
import 'package:educationsite/controllers/user_controller.dart';
import 'package:educationsite/controllers/video_controller.dart';
import 'package:get/get.dart';

import '../discount_Controller.dart';

class AppBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashController>(() => SplashController(),fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(),fenix: true);
    Get.lazyPut<UserController>(() => UserController());
    // Get.lazyPut<UserController>(() => UserController(),fenix: true);
    Get.lazyPut<FavoriteController>(() => FavoriteController(),fenix: true);
    Get.lazyPut<BasketController>(() => BasketController(),fenix: true);
    Get.lazyPut<SearchProductController>(() => SearchProductController(),fenix: true);
    Get.lazyPut<DiscountController>(() => DiscountController(),fenix: true);
    Get.lazyPut<VideoController>(() => VideoController(),fenix: true);
    Get.lazyPut<TicketController>(() => TicketController(),fenix: true);
  }

}