import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans/constans.dart';
import '../controllers/user_controller.dart';
import '../widgets/base_widget.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_feild.dart';


class LogInScreen extends GetView<UserController> {
   LogInScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        title: Text('ورود به برنامه', style:  kHeaderText,),
        elevation: 0.7,

      ),
      child: Column(
        children: [
          // const Spacer(),
          const SizedBox(
            height: 50,
          ),
          MyTextFeild(
            controller: controller.emailController,
            hintText: 'ایمیل',
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
          MyButton(text: 'ورود', onTapped: () {
            controller.LogIn();
          }),
          const Spacer(),
        ],
      ),
    );
  }
}
