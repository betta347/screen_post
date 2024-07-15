import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:screen_post/core/theme/app_icons.dart';
import 'package:screen_post/core/utils/utils.dart';
import 'package:screen_post/features/telegram/models/message_model.dart';
import 'package:swipe_to/swipe_to.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({
    super.key,
    required this.swipedMessageNotifier,
    required this.focusNode,
    required this.message,
    required this.isLastMessage,
  });

  final ValueNotifier<MessageModel> swipedMessageNotifier;
  final FocusNode focusNode;
  final MessageModel message;
  final bool isLastMessage;

  @override
  Widget build(BuildContext context) {
    return SwipeTo(
      key: UniqueKey(),
      onLeftSwipe: (details) {
        swipedMessageNotifier.value = message;
        focusNode.requestFocus();
      },
      iconColor: Colors.white,
      offsetDx: .4,
      swipeSensitivity: 10,
      child: ChatBubble(
        alignment: message.isMe ? Alignment.topRight : Alignment.topLeft,
        elevation: 2,
        shadowColor: Colors.black,
        clipper: ChatBubbleClipper5(
          type: message.isMe ? BubbleType.sendBubble : BubbleType.receiverBubble,
          radius: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
        backGroundColor: message.isMe ? const Color(0xFF6968F0) : const Color(0xFF242E3C),
        margin: EdgeInsets.only(
          top: 10,
          left: message.isMe ? MediaQuery.of(context).size.width * .1 : 0,
          right: message.isMe ? 0 : MediaQuery.of(context).size.width * .1,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (message.replyMessage.message.isNotEmpty) const SizedBox(height: 56),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0, top: 5.0, right: 6.0),
                  child: Text(
                    message.message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      inherit: true,
                    ),
                    textAlign: TextAlign.start,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .2,
                  height: 18,
                ),
              ],
            ),
            if (message.replyMessage.message.isNotEmpty)
              Positioned(
                top: 5,
                left: 0,
                right: 6,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border(
                        left: BorderSide(color: message.isMe ? Colors.white : const Color(0xFF42CFC2), width: 3),
                      ),
                      color: message.isMe ? Colors.white.withOpacity(.1) : const Color(0xFF42CFC2).withOpacity(.2)),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 6, top: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.replyMessage.author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: message.isMe ? Colors.white : const Color(0xFF42CFC2),
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        message.replyMessage.message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat('hh:mm ').format(DateTime.parse(message.date)),
                    style: TextStyle(
                      color: message.isMe ? Colors.white : Color(0xFF838383),
                      fontSize: 12,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  AppUtils.kGap2,
                  if (message.isMe)
                    SvgPicture.asset(
                      isLastMessage ? AppIcons.tgCheck : AppIcons.tgDoubleCheck,
                      color: Colors.white,
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
