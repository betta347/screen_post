import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screen_post/core/extension/extension.dart';
import 'package:screen_post/core/theme/app_icons.dart';
import 'package:screen_post/core/utils/utils.dart';
import 'package:screen_post/features/telegram/models/my_model.dart';
import 'package:screen_post/features/telegram/models/user_model.dart';
import 'package:screen_post/features/telegram/widgets/bottomsheet/user_edit_bottomsheet.dart';

class TelegramAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TelegramAppBar({
    super.key,
    required this.userNotifier,
    required this.myModelNotifier,
  });

  final ValueNotifier<UserModel> userNotifier;
  final ValueNotifier<MyModel> myModelNotifier;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: context.color.telegramAppBarColor,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            AppIcons.tgBack,
            color: Colors.white,
          ),
        ),
      ),
      titleSpacing: 0,
      title: ValueListenableBuilder(
        valueListenable: userNotifier,
        builder: (context, user, child) => Row(
          children: [
            GestureDetector(
              onTap: () async {
                final path = await ImagePicker().pickImage(source: ImageSource.gallery);

                if (path != null && path.path.isNotEmpty) {
                  userNotifier.value = user.copyWith(userPhoto: path.path);
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: user.userPhoto.contains("assets")
                    ? Image.asset(
                        width: 44,
                        height: 44,
                        user.userPhoto,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        width: 44,
                        height: 44,
                        File(user.userPhoto),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            AppUtils.kGap12,
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: context.color.telegramAppBarColor,
                  isScrollControlled: true,
                  isDismissible: false,
                  builder: (context) {
                    return UserEditBottomsheet(
                      myModelNotifier: myModelNotifier,
                      userNotifier: userNotifier,
                    );
                  },
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: user.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        const TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Color(0xFF838383),
                            fontFamily: "Roboto",
                            fontSize: 14,
                          ),
                        ),
                        if (user.isVerified)
                          WidgetSpan(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  color: Colors.white,
                                  width: 6,
                                  height: 6,
                                ),
                                SvgPicture.asset(AppIcons.tgVerification),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  AppUtils.kGap4,
                  Text(
                    user.isOnline
                        ? 'Online'
                        : user.isTyping
                            ? '••• typing'
                            : user.lastSeen,
                    style: TextStyle(
                      color: user.isOnline || user.isTyping ? const Color(0xFF8D9FD1) : const Color(0xFF838383),
                      fontFamily: "Roboto",
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        SvgPicture.asset(
          AppIcons.tgCall,
          color: Colors.white,
        ),
        AppUtils.kGap16,
        SvgPicture.asset(
          AppIcons.tgDots,
          color: Colors.white,
        ),
        AppUtils.kGap16,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
