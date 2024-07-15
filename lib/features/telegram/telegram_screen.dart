import 'package:flutter/material.dart';
import 'package:screen_post/core/theme/app_images.dart';
import 'package:screen_post/features/telegram/models/message_model.dart';
import 'package:screen_post/features/telegram/models/my_model.dart';
import 'package:screen_post/features/telegram/models/user_model.dart';
import 'package:screen_post/features/telegram/widgets/bottom_text_field.dart';
import 'package:screen_post/features/telegram/widgets/message_model.dart';
import 'package:screen_post/features/telegram/widgets/telegram_app_bar.dart';

class TelegramScreen extends StatefulWidget {
  const TelegramScreen({super.key});

  @override
  State<TelegramScreen> createState() => _TelegramScreenState();
}

class _TelegramScreenState extends State<TelegramScreen> {
  late final TextEditingController messageController;
  late final ValueNotifier<bool> isTypingNotifier;
  late final ValueNotifier<List<MessageModel>> messagesNotifier;
  late final ValueNotifier<MessageModel> swipedMessageNotifier;
  late final ValueNotifier<UserModel> userNotifier;
  late final ValueNotifier<MyModel> myModelNotifier;
  late final ScrollController scrollController;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    isTypingNotifier = ValueNotifier<bool>(false);
    swipedMessageNotifier = ValueNotifier(const MessageModel());
    scrollController = ScrollController();
    focusNode = FocusNode();
    messagesNotifier = ValueNotifier<List<MessageModel>>([]);
    myModelNotifier = ValueNotifier<MyModel>(
      const MyModel(
        id: 1,
        myName: 'Jayson Khan',
      ),
    );
    userNotifier = ValueNotifier<UserModel>(
      const UserModel(
        id: 1,
        name: 'Telegram',
        userPhoto:
            "https://store-images.s-microsoft.com/image/apps.55245.13537716651231321.3067a421-6c2f-48a9-b77c-1e38e19146e6.10e2aa49-52ca-4e79-9a61-b6422978afb9?h=210",
        lastSeen: 'service notifications',
        isOnline: false,
        isTyping: false,
        isVerified: false,
      ),
    );
    messageController = TextEditingController()
      ..addListener(
        () async {
          isTypingNotifier.value = messageController.text.isNotEmpty;

          if (messageController.text.isEmpty) {
            await Future.delayed(const Duration(milliseconds: 300));
            await scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.tgDarkBg,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: TelegramAppBar(
            userNotifier: userNotifier,
            myModelNotifier: myModelNotifier,
          ),
          body: ValueListenableBuilder(
            valueListenable: messagesNotifier,
            builder: (context, messages, child) => messages.isEmpty
                ? Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.gifYes,
                            height: 100,
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              'You ready to chat with Telegram',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: messages.map((message) {
                      return MessageItem(
                        swipedMessageNotifier: swipedMessageNotifier,
                        focusNode: focusNode,
                        message: message,
                        isLastMessage: messages.last == message,
                      );
                    }).toList(),
                  ),
          ),
          bottomNavigationBar: BottomTextField(
            swipedMessageNotifier: swipedMessageNotifier,
            myModelNotifier: myModelNotifier,
            userNotifier: userNotifier,
            isTypingNotifier: isTypingNotifier,
            messagesNotifier: messagesNotifier,
            messageController: messageController,
            scrollController: scrollController,
            focusNode: focusNode,
          ),
        ),
      ],
    );
  }
}
