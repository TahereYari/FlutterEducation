import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/controllers/ticket_controller.dart';
import 'package:educationsite/models/message.dart';
import 'package:educationsite/models/ticket.dart';
import 'package:educationsite/services/app_routs.dart';
import 'package:educationsite/widgets/base_widget.dart';
import 'package:educationsite/widgets/my_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';

class TicketHomeScreen extends GetView<TicketController> {
   TicketHomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        title: Text(
          'تیکت',
          style: kHeaderText,
        ),
        elevation: 0.7,
      ),
      child: SizedBox(
        // height: Get.height,
        child: controller.currentTicket.value.id == null
            ? Column(children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: Text(
                  'تیکت فعالی وجود ندارد.',
                  style: kHeaderText,
                )),
                Center(
                  child: TextButton(
                      onPressed: () {
                        // controller.basketproducts();
                       controller.getProductList();
                        Get.toNamed(AppRouts.ticketCreate);
                      },
                      child: Text(
                        'ایجاد تیکت جدید',
                        style: kTextStyle.copyWith(color: kBlueColor),
                      )),
                ),
                Spacer(),
              ])
            : Column(children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: Text(
                  'شما یک تیکت فعال دارید .',
                  style: kHeaderText,
                )),
                Center(
                  child: TextButton(
                      onPressed: () {
                        controller.getmessages();
                        Get.toNamed(AppRouts.messageTicket);
                      },
                      child: Text(
                        'لیست پیامها',
                        style: kTextStyle.copyWith(color: kBlueColor),
                      )),
                ),
                Spacer(),
              ]),
      ),
    );
  }
}
