import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen_post/core/extension/context_popup_extension.dart';
import 'package:screen_post/core/extension/extension.dart';
import 'package:screen_post/core/utils/utils.dart';
import 'package:screen_post/core/widgets/buttons/bouncing_button.dart';
import 'package:screen_post/core/widgets/popup_container/popup_container.dart';

class RightButton extends StatelessWidget {
  final String text;
  final String svgIcon;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final bool isComingSoon;

  const RightButton({
    super.key,
    required this.text,
    required this.svgIcon,
    required this.onPressed,
    required this.color,
    required this.textColor,
    this.isComingSoon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: BouncingButton(
        onPressed: isComingSoon
            ? () {
                context.showPopUp(
                  context: context,
                  status: PopStatus.warning,
                  title: "Coming Soon",
                );
              }
            : onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: AppUtils.kPaddingAll16,
          decoration: BoxDecoration(
            color: isComingSoon ? context.color.grey2 : color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                svgIcon,
                color: textColor,
              ),
              AppUtils.kGap6,
              Text(
                text,
                style: context.textStyle.regular20.copyWith(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
