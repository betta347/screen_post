import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:screen_post/core/extension/extension.dart';
import 'package:screen_post/core/theme/app_icons.dart';
import 'package:screen_post/core/utils/utils.dart';
import 'package:screen_post/features/home/widgets/left_button.dart';
import 'package:screen_post/features/home/widgets/right_button.dart';
import 'package:screen_post/router/app_routes.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        title: const Text("Welcome to Screen Post"),
        actions: [
          GestureDetector(
            onTap: () {
              launchUrlString("https://t.me/+kvsxAPluXpdmODQy");
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: AppUtils.kPaddingAll4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: context.color.white,
                ),
              ),
              child: Text(
                "JAYSON'S CLUB",
                textAlign: TextAlign.center,
                style: context.textStyle.regular14.copyWith(
                  color: context.color.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: AppUtils.kPaddingVertical16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LeftButton(
              text: "Make a telegram post",
              svgIcon: AppIcons.telegram,
              onPressed: () {
                context.pushNamed(Routes.telegram);
              },
              color: context.color.telegram,
              textColor: context.color.white,
            ),
            RightButton(
              text: "Make a twitter post",
              svgIcon: AppIcons.twitter,
              onPressed: () {
                context.pushNamed(Routes.twitter);
              },
              color: context.color.twitter,
              textColor: context.color.white,
              isComingSoon: true,
            ),
            LeftButton(
              text: "Make a instagram post",
              svgIcon: AppIcons.instagram,
              onPressed: () {
                context.pushNamed(Routes.instagram);
              },
              color: context.color.instagram,
              textColor: context.color.white,
              isComingSoon: true,
            ),
            RightButton(
              text: "Make a simple post",
              svgIcon: AppIcons.post,
              onPressed: () {
                context.pushNamed(Routes.myPost);
              },
              color: context.color.green,
              textColor: context.color.white,
              isComingSoon: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          launchUrlString("https://t.me/+kvsxAPluXpdmODQy");
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: AppUtils.kPaddingAll16,
          decoration: BoxDecoration(
            color: context.color.telegram,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.telegram,
                color: context.color.white,
              ),
              AppUtils.kGap6,
              Text(
                "Join our telegram chanel",
                style: context.textStyle.regular20.copyWith(
                  color: context.color.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
