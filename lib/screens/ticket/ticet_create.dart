import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/controllers/ticket_controller.dart';
import 'package:educationsite/widgets/base_widget.dart';
import 'package:educationsite/widgets/my_button.dart';
import 'package:educationsite/widgets/my_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketCreate extends GetView<TicketController> {
  const TicketCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        title: Text('افزودن تیکت جدید', style:  kHeaderText,),
        elevation: 0.7,

      ),
      child: SizedBox(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Spacer(),
            const SizedBox(
              height: 50,
            ),
            Text(
              ' نام دوره ',
              style: kTextStyle,
            ),
            Obx(
                  () => SizedBox(
                   width: Get.width,
                  child: DropdownButton(
                  value: controller.dropDownValue.value!,
                  isExpanded: true,
                  style: kTextStyle,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 0,
                  underline: Container(
                    height: 2,
                    color: kGreenColor,
                  ),

                  items: controller.dropdownMyProductList,
                  onChanged: (int? value) {

                     controller.dropDownValue.value = value!;

                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextFeild(
              controller: controller.titileController,
              hintText: 'عنوان تیکت',
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextFeild(
              controller: controller.messagefirstController,
              hintText: ' پیام خود را وارد کنید.',
              maxLines: 10,
              height: 100,
            ),


            const SizedBox(
              height: 50,
            ),
            MyButton(text: 'ارسال پیام', onTapped: () {
              controller.insertTicket();

            }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
