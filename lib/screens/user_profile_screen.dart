import 'package:educationsite/controllers/home_controller.dart';
import 'package:educationsite/controllers/splash_controller.dart';
import 'package:educationsite/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans/constans.dart';
import '../widgets/base_widget.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_feild.dart';


class UserProfile extends GetView<UserController> {
  UserProfile({super.key});


  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        title: Text('پروفایل کاربری', style:  kHeaderText,),
        elevation: 0.7,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:10),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                 //   backgroundColor: kLightGreyColor,
                    radius: 60,
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Get.find<SplashController>().activeUser.value.image != ''
                              ? Image.network(
                            'http://10.0.2.2:8000/image/user/${Get.find<SplashController>().activeUser.value.image }',
                                  fit: BoxFit.cover,
                                )
                              : FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder: const AssetImage(
                                    'assets/images/userDefult.png',
                                  ),
                                  image: NetworkImage(
                                    'http://10.0.2.2:8000/image/user/${Get.find<SplashController>().activeUser.value.image }',
                                  ),
                                ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: const Icon(Icons.camera_alt,color: kRedColor,),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: kGreenColor,thickness: 2,),

            const SizedBox(
              height: 20,
            ),
            MyTextFeild(controller: controller.nameController),

            const SizedBox(
              height: 20,
            ),
            MyTextFeild(controller: controller.telController),

            const SizedBox(
              height: 20,
            ),
            MyTextFeild(controller: controller.emailController),

            const SizedBox(
              height: 20,
            ),


            const SizedBox(
              height: 20,
            ),
            MyButton(text: 'ویرایش اطلاعات', onTapped: (){}),

          ],
        ),
      ),
    );
  }
}
