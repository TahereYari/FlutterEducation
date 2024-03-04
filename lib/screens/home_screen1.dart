import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/controllers/basket_controller.dart';
import 'package:educationsite/controllers/favorite_controller.dart';
import 'package:educationsite/controllers/splash_controller.dart';
import 'package:educationsite/controllers/user_controller.dart';
import 'package:educationsite/services/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // backgroundColor: Colors.red,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Obx(
                  ()=> Column(
                    children: [
                      Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 40,
                              child: SizedBox(
                                width: 80,
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Get.find<SplashController>()
                                              .site
                                              .value
                                              .image !=
                                          null
                                      ? Image.network(
                                          '${local}/image/logo/${Get.find<SplashController>().site.value.image!}',
                                          fit: BoxFit.cover,
                                        )
                                      : FadeInImage(
                                          fit: BoxFit.cover,
                                          placeholder: const AssetImage(
                                            'assets/images/shop.png',
                                          ),
                                          image: NetworkImage(
                                            '${local}/image/logo/${Get.find<SplashController>().site.value.image!}',
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '  اپلیکیشن ${Get.find<SplashController>().site.value.name!}',
                            style:
                                kTextStyle.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: controller.token == '-1'
                    ? CircleAvatar(
                        radius: 20,
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: AssetImage(
                                'assets/images/userDefult.png',
                              ),
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                           Get.find<UserController>().editUserProfile();
                        },
                        child: Obx(
                          ()=> Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: controller.activeUser.value.image!= null
                                          ? FadeInImage(
                                              fit: BoxFit.cover,
                                              placeholder: const AssetImage(
                                                'assets/images/userDefult.png',
                                              ),
                                              image: NetworkImage(
                                                '${local}/image/user/${controller.activeUser.value.image}',
                                              ),
                                            )
                                          : Image.network(
                                              '${local}/image/user/${controller.activeUser.value.image}',
                                              fit: BoxFit.cover,
                                            )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                controller.activeUser.value.name!.length > 15
                                ?'${controller.activeUser.value.name!.substring(0,15)}...'
                                : controller.activeUser.value.name!,
                                style: kTextStyle.copyWith(color: Colors.blue),
                              ),
                              Spacer(),
                              Text('خروج'),
                              IconButton(
                                  onPressed: () {
                                    Get.find<UserController>().logOut();
                                  },
                                  icon: Icon(Icons.exit_to_app_rounded)),
                            ],
                          ),
                        ),
                      ),
              ),
              const Divider(
                color: kGreenColor,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              controller.token != '-1'
                  ? Obx(
                  ()=> ListTile(
                        title: const Text('علاقه مندی های من'),
                        leading: const Icon(
                          Icons.favorite_outlined,
                          color: kGreenColor,
                        ),
                        onTap: () {
                          Get.find<FavoriteController>().favoriteList.clear();
                          Get.find<FavoriteController>().getFavorite();
                          Get.toNamed(AppRouts.favoriteScreen);
                        },
                      ),
                  )
                  : ListTile(),
              controller.token != '-1'
                  ? Obx(
                  ()=> ListTile(
                        title: const Text('لیست خریدهای من'),
                        leading: const Icon(
                          Icons.shopping_basket_sharp,
                          color: kGreenColor,
                        ),
                        onTap: () {
                          Get.find<BasketController>().getMyBasket();

                          Get.toNamed(AppRouts.myBasketScreen);
                        },
                      ),
                  )
                  : ListTile(),
              Spacer(),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: kMainBlueColor,
          title: Text(
            Get.find<SplashController>().site.value.name! == null
                ? 'اپلیکیشن'
                : ' اپلیکیشن ${Get.find<SplashController>().site.value.name!}',
            style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: [
            controller.token == '-1'
                ? Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: IconButton(
                          onPressed: () {
                            Get.toNamed(AppRouts.signUpScreen);
                          },
                          icon: const Icon(Icons.app_registration_sharp),
                          color: kBlackColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: IconButton(
                          onPressed: () {
                            Get.toNamed(AppRouts.loginScreen);
                          },
                          icon: const Icon(Icons.login_rounded),
                          color: kBlackColor,
                        ),
                      )
                    ],
                  )
                : TextButton(
                    onPressed: () {},
                    child: IconButton(
                      onPressed: () {
                        Get.find<UserController>().logOut();
                      },
                      icon: const Icon(Icons.cancel_outlined),
                      color: kBlackColor,
                    ),
                  ),
          ],
        ),

        body: Obx(
            ()=> PageTransitionSwitcher(
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return SharedAxisTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
            child: controller.homeWidget[controller.currentIndex.value],
          ),
        ),

        bottomNavigationBar: Obx(
          ()=> CurvedNavigationBar(
            items: [
              Icon(
                Icons.home_outlined,
                color: kGreenColor,
              ),
              Icon(Icons.shopping_cart_outlined,
                  color: Get.find<BasketController>().basketProductList != null ||
                          Get.find<BasketController>().basket.value != null
                      ? kRedColor
                      : kGreenColor),
              Icon(
                Icons.search_rounded,
                color: kGreenColor,
              ),
            ],
            height: 60,
            backgroundColor: Colors.white,
            color: kPhirozeColor,
            buttonBackgroundColor: kLightGreenColor,
            index: controller.currentIndex.value,
            onTap: (value) {
              controller.changeIndex(value);
            },
            animationDuration: const Duration(milliseconds: 400),
          ),
        ),
      )
    ;
  }
}
