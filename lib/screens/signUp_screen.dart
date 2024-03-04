import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans/constans.dart';
import '../controllers/user_controller.dart';
import '../widgets/base_widget.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_feild.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
   final controller = Get.find<UserController>(tag: 'signup');

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        title: Text('ثبت نام', style:  kHeaderText,),
        elevation: 0.7,

      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // const Spacer(),
            const SizedBox(
              height: 20,
            ),
            MyTextFeild(
              controller: controller.nameController,
              hintText: 'نام کاربری',
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextFeild(
              controller: controller.emailController,
              hintText: 'ایمیل ',
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextFeild(
              controller: controller.telController,
              hintText: 'شماره تلفن ',
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              child: TextField(
                controller: controller.passController,
                obscuringCharacter: '\u25CF',
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'رمز عبور',
                  hintStyle: kHintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: kGreenColor),
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.changeShowPassword();

                    },
                    icon: const Icon(
                        Icons.visibility_off_rounded),
                    color: Colors.grey,
                  ),

                ),
                // obscuringCharacter:obscuringCharacter!,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              child: TextField(
                controller: controller.confirmPassController,
                obscuringCharacter: '\u25CF',
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'رمز عبور',
                  hintStyle: kHintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: kGreenColor),
                  ),
                  filled: true,
                  fillColor: Colors.white70,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.changeShowPassword();

                    },
                    icon: const Icon(
                        Icons.visibility_off_rounded),
                    color: Colors.grey,
                  ),

                ),
                // obscuringCharacter:obscuringCharacter!,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MyButton(
                text: 'ثبت نام',
                color: kMainBlueColor.withOpacity(0.5),
                onTapped: () {
              controller.SingnUp();

            }),
            // const Spacer(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
