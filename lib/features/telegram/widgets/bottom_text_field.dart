import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen_post/core/extension/extension.dart';
import 'package:screen_post/core/theme/app_icons.dart';
import 'package:screen_post/core/utils/utils.dart';
import 'package:screen_post/features/telegram/models/message_model.dart';
import 'package:screen_post/features/telegram/models/my_model.dart';
import 'package:screen_post/features/telegram/models/reply_message.dart';
import 'package:screen_post/features/telegram/models/user_model.dart';

class BottomTextField extends StatelessWidget {
  const BottomTextField({
    super.key,
    required this.swipedMessageNotifier,
    required this.myModelNotifier,
    required this.userNotifier,
    required this.isTypingNotifier,
    required this.messagesNotifier,
    required this.messageController,
    required this.scrollController,
    required this.focusNode,
  });

  final ValueNotifier<MessageModel> swipedMessageNotifier;
  final ValueNotifier<MyModel> myModelNotifier;
  final ValueNotifier<UserModel> userNotifier;
  final ValueNotifier<bool> isTypingNotifier;
  final ValueNotifier<List<MessageModel>> messagesNotifier;
  final TextEditingController messageController;
  final ScrollController scrollController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: context.color.telegramAppBarColor,
      ),
      child: ValueListenableBuilder(
        valueListenable: swipedMessageNotifier,
        builder: (context, swipedMessage, child) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedCrossFade(
              firstChild: const SizedBox(),
              secondChild: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppIcons.tgEdit,
                      color: const Color(0xFF42CFC2),
                    ),
                    AppUtils.kGap8,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Replying to ${swipedMessage.isMe ? myModelNotifier.value.myName : userNotifier.value.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF42CFC2),
                              fontSize: 14,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            swipedMessage.message,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF758191),
                              fontSize: 12,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppUtils.kGap8,
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        swipedMessageNotifier.value = const MessageModel();
                      },
                      child: SvgPicture.asset(
                        AppIcons.clear,
                        color: const Color(0xFF758191),
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState: swipedMessage.message.isNotEmpty ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
            swipedMessage.message.isNotEmpty
                ? Divider(
                    color: context.color.black,
                  )
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder(
                    valueListenable: isTypingNotifier,
                    builder: (context, isTyping, child) => isTyping
                        ? GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              messagesNotifier.value = [
                                ...messagesNotifier.value,
                                MessageModel(
                                  date: DateTime.now().toString(),
                                  id: 35,
                                  isMe: false,
                                  message: messageController.text,
                                  replyMessage: ReplyMessage(
                                    author: swipedMessage.isMe ? myModelNotifier.value.myName : userNotifier.value.name,
                                    message: swipedMessage.message,
                                  ),
                                ),
                              ];
                              messageController.clear();
                              isTypingNotifier.value = false;
                              swipedMessageNotifier.value = const MessageModel();
                              scrollController.jumpTo(scrollController.position.maxScrollExtent);
                            },
                            child: Transform.rotate(
                              angle: 3.14,
                              child: SvgPicture.asset(
                                AppIcons.tgSend,
                                color: const Color(0xFF758191),
                              ),
                            ),
                          )
                        : SvgPicture.asset(
                            AppIcons.tgEmoji,
                            color: const Color(0xFF758191),
                          ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      focusNode: focusNode,
                      cursorColor: const Color(0xFF6B9BCB),
                      cursorHeight: 24,
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: "Message",
                        hintStyle: TextStyle(
                          color: Color(0xFF758191),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    AppIcons.tgAttach,
                    color: Color(0xFF758191),
                  ),
                  AppUtils.kGap16,
                  ValueListenableBuilder(
                    valueListenable: isTypingNotifier,
                    builder: (context, isTyping, child) => isTyping
                        ? GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              messagesNotifier.value = [
                                ...messagesNotifier.value,
                                MessageModel(
                                  date: DateTime.now().toString(),
                                  id: 35,
                                  isMe: true,
                                  message: messageController.text,
                                  replyMessage: ReplyMessage(
                                    author: swipedMessage.isMe ? myModelNotifier.value.myName : userNotifier.value.name,
                                    message: swipedMessage.message,
                                  ),
                                ),
                              ];
                              messageController.clear();
                              isTypingNotifier.value = false;
                              swipedMessageNotifier.value = const MessageModel();
                              scrollController.jumpTo(scrollController.position.maxScrollExtent);
                            },
                            child: SvgPicture.asset(
                              AppIcons.tgSend,
                              color: Color(0xFF758191),
                            ),
                          )
                        : SvgPicture.asset(
                            AppIcons.tgVoice,
                            color: Color(0xFF758191),
                          ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
