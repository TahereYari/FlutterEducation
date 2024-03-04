import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:animations/animations.dart';
import 'package:educationsite/controllers/favorite_controller.dart';
import 'package:educationsite/controllers/ticket_controller.dart';
import 'package:educationsite/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../constans/constans.dart';
import '../controllers/basket_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/splash_controller.dart';
import '../services/app_routs.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:
      //     controller.token == '-1'
      //      ?[
      //   DrawerHeader(
      //   decoration: BoxDecoration(
      //   color: Colors.blue,
      //   ),
      //   child:  Column(
      //     children: [
      //       Column(
      //         children: [
      //           Center(
      //             child: CircleAvatar(
      //               radius: 40,
      //               child: SizedBox(
      //                 width: 80,
      //                 height: 80,
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.circular(40),
      //                   child: Get.find<SplashController>()
      //                       .site
      //                       .value
      //                       .image !=
      //                       null
      //                       ? Image.network(
      //                     '${local}/image/logo/${Get.find<SplashController>().site.value.image}',
      //                     fit: BoxFit.cover,
      //                   )
      //                       : FadeInImage(
      //
      //                     fit: BoxFit.cover,
      //                     placeholder:  AssetImage(
      //                       'assets/images/logodefult.png',
      //
      //                     ),
      //                     image: NetworkImage(
      //                       '${local}/image/logo/${Get.find<SplashController>().site.value.image}',
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Text(
      //             ' اپلیکیشن ${Get.find<SplashController>().site.value.name}',
      //             style:
      //             kTextStyle.copyWith(fontWeight: FontWeight.bold),
      //           ),
      //
      //           // Text(
      //           //   'فروشگاه رز',
      //           //   style:
      //           //   kTextStyle.copyWith(fontWeight: FontWeight.bold),
      //           // ),
      //         ],
      //       ),
      //     ],
      //   ),
      //
      // ),
      // ]
      //     :
          [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child:  Column(
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
                                    ?  FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder: const AssetImage(
                                    'assets/images/logodefult.png',
                                  ),
                                  image: NetworkImage(
                                    '${local}/image/logo/${Get.find<SplashController>().site.value.image}',
                                  ),
                                )
                                    :Image.asset(
                                  'assets/images/logodefult.png',
                                  fit: BoxFit.cover,
                                ),


                              ),
                            ),
                          ),
                        ),
                        Text(
                            Get.find<SplashController>().site.value.name != null
                         ? ' اپلیکیشن ${Get.find<SplashController>().site.value.name}'
                            : 'اپلیکیشن',
                          style:
                              kTextStyle.copyWith(fontWeight: FontWeight.bold),
                        ),

                        // Text(
                        //   'فروشگاه رز',
                        //   style:
                        //   kTextStyle.copyWith(fontWeight: FontWeight.bold),
                        // ),
                      ],
                    ),
                  ],
                ),

            ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {


                  // Get.toNamed(AppRouts.userAdminProfileScreen , arguments: controller.activeUser.value!);
                },
                child:Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.find<UserController>().editUserProfile();
                        },
                        child: CircleAvatar(
                          radius: 20,
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Get.find<SplashController>().activeUser.value
                                    .image != null
                                    ?  FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder: const AssetImage(
                                    'assets/images/userDefult.png',
                                  ),
                                  image: NetworkImage(
                                    '${local}/image/user/${Get.find<SplashController>().activeUser.value.image}',
                                  ),
                                )
                                    :Image.asset(
                                  'assets/images/userDefult.png',
                                  fit: BoxFit.cover,
                                ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: (){
                          Get.find<UserController>().editUserProfile();
                        },
                        child: Expanded(
                          child: Text(
                            Get.find<SplashController>().activeUser.value.name != null
                            ?' ${Get.find<SplashController>().activeUser.value.name}'
                                      :'نام کاربر',

                            style: kTextStyle,
                          ),
                        ),
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
            const Divider(
              color: kGreenColor,
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('علاقه مندی های من'),
              leading: const Icon(
                Icons.favorite_outlined,
                color: kRedColor,
              ),
              onTap: () {
                Get.find<FavoriteController>().favoriteList.clear();
                Get.find<FavoriteController>().getFavorite();
                Get.toNamed(AppRouts.favoriteScreen);
              },
            ),
            ListTile(
              title: const Text('لیست خریدهای من'),
              leading: const Icon(
                Icons.shopping_cart_sharp,
                color: kBlueColor,
              ),
              onTap: () {

                Get.find<BasketController>().getMyBasket();

                Get.toNamed(AppRouts.myBasketScreen);
              },
            ),

            ListTile(
              title:  Text('پشتیبانی'),
              leading:  Icon(
                Icons.support_rounded,
                color: kBlueColor,
              ),
              onTap: () {
                    Get.find<TicketController>().getCurrentTicket();
                   Get.toNamed(AppRouts.ticketHomeScreen);

              }

            ),

            Spacer(),
          ]

        ),
      ),
      appBar: AppBar(
        backgroundColor: kBlueColor,
        title: Text(
          Get.find<SplashController>().site.value.name != null
              ? ' اپلیکیشن ${Get.find<SplashController>().site.value.name}'
              : 'اپلیکیشن',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          // IconButton(onPressed:(){
          //   Get.toNamed(AppRouts.homeScreen);
          // }, icon: Icon(Icons.reset_tv_outlined))
        ],
      ),
      body: Obx(
            () => PageTransitionSwitcher(
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
      // bottomNavigationBar: Obx(
      //   () => AnimatedNotchBottomBar(
      //     notchBottomBarController:
      //         NotchBottomBarController(index: controller.currentIndex.value),
      //     bottomBarItems: const [
      //       BottomBarItem(
      //         inActiveItem: Icon(
      //           Icons.home_outlined,
      //           color: kRedColor,
      //         ),
      //         activeItem: Icon(
      //           Icons.home_filled,
      //           color: kGreenColor,
      //         ),
      //         itemLabel: 'صفحه اصلی',
      //       ),
      //       BottomBarItem(
      //         inActiveItem: Icon(
      //           Icons.shopping_cart_outlined,
      //           color: kRedColor,
      //         ),
      //         activeItem: Icon(
      //           Icons.shopping_cart,
      //           color: kGreenColor,
      //         ),
      //         itemLabel: 'سبد خرید',
      //       ),
      //       BottomBarItem(
      //         inActiveItem: Icon(
      //           Icons.search_rounded,
      //           color: kRedColor,
      //         ),
      //         activeItem: Icon(
      //           Icons.search_rounded,
      //           color: kGreenColor,
      //         ),
      //         itemLabel: 'جست و جو',
      //       ),
      //       // BottomBarItem(
      //       //   inActiveItem: Icon(
      //       //     Icons.account_circle_outlined,
      //       //     color: kRedColor,
      //       //   ),
      //       //   activeItem: Icon(
      //       //     Icons.account_circle,
      //       //     color: kGreenColor,
      //       //   ),
      //       //   itemLabel: 'پروفایل',
      //       // ),
      //
      //     ],
      //
      //     durationInMilliSeconds: 500,
      //     color: kGreyColor,
      //
      //
      //     onTap: (value) {
      //       controller.changeIndex(value);
      //     },
      //   ),
      // ),

      bottomNavigationBar: Obx(
            () => CurvedNavigationBar(
          items: const [
            Icon(
              Icons.home_outlined,
              color: kGreenColor,
            ),
            Icon(
              Icons.shopping_cart_outlined,
              color: kGreenColor,
            ),
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
    );
  }
}
