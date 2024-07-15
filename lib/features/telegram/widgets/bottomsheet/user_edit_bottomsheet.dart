import 'package:flutter/material.dart';
import 'package:screen_post/core/extension/extension.dart';
import 'package:screen_post/core/utils/utils.dart';
import 'package:screen_post/features/telegram/models/my_model.dart';
import 'package:screen_post/features/telegram/models/user_model.dart';

class UserEditBottomsheet extends StatefulWidget {
  const UserEditBottomsheet({
    super.key,
    required this.myModelNotifier,
    required this.userNotifier,
  });

  final ValueNotifier<MyModel> myModelNotifier;
  final ValueNotifier<UserModel> userNotifier;

  @override
  State<UserEditBottomsheet> createState() => _UserEditBottomsheetState();
}

class _UserEditBottomsheetState extends State<UserEditBottomsheet> {
  late final TextEditingController myNameController;
  late final TextEditingController userNameController;
  late final TextEditingController lastSeenController;
  late final ValueNotifier<bool> isTypingNotifier;
  late final ValueNotifier<bool> isOnlineNotifier;
  late final ValueNotifier<bool> isVerifiedNotifier;

  @override
  void initState() {
    super.initState();
    myNameController = TextEditingController(text: widget.myModelNotifier.value.myName);
    userNameController = TextEditingController(text: widget.userNotifier.value.name);
    lastSeenController = TextEditingController(text: widget.userNotifier.value.lastSeen);
    isTypingNotifier = ValueNotifier<bool>(widget.userNotifier.value.isTyping);
    isOnlineNotifier = ValueNotifier<bool>(widget.userNotifier.value.isOnline);
    isVerifiedNotifier = ValueNotifier<bool>(widget.userNotifier.value.isVerified);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16).copyWith(bottom: context.viewInsets.bottom + 16),
      color: context.color.telegramAppBarColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppUtils.kGap16,
          TextField(
            controller: myNameController,
            decoration: InputDecoration(
              hintText: 'Name',
              hintStyle: context.textStyle.bodyCallout,
              label: const Text('What is your name?'),
              labelStyle: context.textStyle.bodyCallout,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.color.white,
                ),
              ),
            ),
            cursorColor: context.color.white,
          ),
          AppUtils.kGap16,
          TextField(
            controller: userNameController,
            decoration: InputDecoration(
              hintText: 'User Name',
              hintStyle: context.textStyle.bodyCallout,
              label: const Text('What is your friend name?'),
              labelStyle: context.textStyle.bodyCallout,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.color.white,
                ),
              ),
            ),
            cursorColor: context.color.white,
          ),
          AppUtils.kGap16,
          TextField(
            controller: lastSeenController,
            decoration: InputDecoration(
              hintText: 'Last Seen',
              hintStyle: context.textStyle.bodyCallout,
              label: const Text('Last online time...'),
              labelStyle: context.textStyle.bodyCallout,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.color.white,
                ),
              ),
            ),
            cursorColor: context.color.white,
          ),
          ValueListenableBuilder(
            valueListenable: isTypingNotifier,
            builder: (context, value, child) => CheckboxListTile(
              title: const Text('Is Typing'),
              checkColor: context.color.white,
              contentPadding: const EdgeInsets.only(left: 8),
              activeColor: context.color.telegram,
              value: value,
              onChanged: (value) {
                isTypingNotifier.value = value ?? false;
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: isOnlineNotifier,
            builder: (context, value, child) => CheckboxListTile(
              title: const Text('Is Online'),
              checkColor: context.color.white,
              contentPadding: const EdgeInsets.only(left: 8),
              activeColor: context.color.telegram,
              value: value,
              onChanged: (value) {
                isOnlineNotifier.value = value ?? false;
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: isVerifiedNotifier,
            builder: (context, value, child) => CheckboxListTile(
              title: const Text('Is Verified'),
              checkColor: context.color.white,
              contentPadding: const EdgeInsets.only(left: 8),
              activeColor: context.color.telegram,
              value: value,
              onChanged: (value) {
                isVerifiedNotifier.value = value ?? false;
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 56,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: context.color.telegram,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                widget.myModelNotifier.value = widget.myModelNotifier.value.copyWith(myName: myNameController.text);
                widget.userNotifier.value = widget.userNotifier.value.copyWith(
                  name: userNameController.text,
                  lastSeen: lastSeenController.text,
                  isTyping: isTypingNotifier.value,
                  isOnline: isOnlineNotifier.value,
                  isVerified: isVerifiedNotifier.value,
                );
                Navigator.of(context).pop();
              },
              child: Text('Save', style: context.textStyle.bodyCallout),
            ),
          ),
        ],
      ),
    );
  }
}
