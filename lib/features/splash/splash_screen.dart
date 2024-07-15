import "dart:async";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:go_router/go_router.dart";
import "package:screen_post/core/extension/extension.dart";
import "package:screen_post/core/theme/app_images.dart";
import "package:screen_post/core/theme/themes.dart";
import "package:screen_post/core/widgets/buttons/bottom_navigation_button.dart";
import "package:screen_post/router/app_routes.dart";

part "mixins/splash_mixin.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashMixin {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemUiOverlayStyle,
        child: Scaffold(
          backgroundColor: context.color.black,
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage(AppImages.logo),
                  height: 164,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationButton(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('0.0.1 version', style: context.textStyle.regularCaption1),
                Image(
                  image: AssetImage(AppImages.gifHello),
                  height: 164,
                ),
              ],
            ),
          ),
        ),
      );
}
