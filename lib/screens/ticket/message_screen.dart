import 'package:educationsite/constans/constans.dart';
import 'package:educationsite/constans/method_static.dart';
import 'package:educationsite/controllers/ticket_controller.dart';
import 'package:educationsite/models/message.dart';
import 'package:educationsite/widgets/base_widget.dart';
import 'package:educationsite/widgets/my_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';

class MessageScreen extends GetView<TicketController> {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
        title: Text(
          controller.supportName != null
              ? 'نام پشتیبان'
              : '${controller.supportName}',
          style: kHeaderText,
        ),
        elevation: 0.7,
        actions: [
          IconButton(
              onPressed: () {
                controller.ticketClose();

              },
              icon: Icon(Icons.close_rounded)),
        ],
      ),
      child: SizedBox(
        // height: Get.height,
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
              stream: controller.messagesController.stream,
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: controller.messageList.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    Message message = controller.messageList[index];
                    return message.supportId == null
                        ? ChatBubble(
                            clipper:
                                ChatBubbleClipper9(type: BubbleType.sendBubble),
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(top: 20),
                            backGroundColor: Colors.blue,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Text(
                                message.message!,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        : ChatBubble(
                            clipper: ChatBubbleClipper9(
                                type: BubbleType.receiverBubble),
                            backGroundColor: Color(0xffE7E7ED),
                            margin: EdgeInsets.only(top: 20),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Text(
                                message.message!,
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                  },
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextFeild(
                      maxLines: 5,
                      minLines: 1,
                      controller: controller.sendMessageController,
                      fillColor: kGreyColor,
                      borderSide: BorderSide.none,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.sendMessage(controller.openticket.value.id!);
                    },
                    icon: Icon(Icons.send),
                    color: kBlueColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
