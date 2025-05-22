//This is custom tooltip popup code--->>



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matthewbaker101_app/constants/app_assets/assets_icons.dart';
import 'package:matthewbaker101_app/constants/app_colors.dart';
import 'package:matthewbaker101_app/constants/text_font_style.dart';
import 'package:matthewbaker101_app/helpers/ui_helpers.dart';
import 'package:super_tooltip/super_tooltip.dart';

class CustomTooltip extends StatefulWidget {
  final String? title;
  final String? content;
  const CustomTooltip({super.key,  this.title,  this.content});

  @override
  State createState() => _TargetWidgetState();
}

class _TargetWidgetState extends State<CustomTooltip> {
  final _controller = SuperTooltipController();
  Future<bool>? _willPopCallback() async {
    if (_controller.isVisible) {
      await _controller.hideTooltip();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) => _willPopCallback,
      child: GestureDetector(
        onTap: () async {
          await _controller.showTooltip();
        },
        child: SuperTooltip(
          controller: _controller,
          popupDirection: TooltipDirection.up,
          backgroundColor: AppColors.cF8F992,
          showCloseButton: false,
          left: 30,
          right: 30,
          bottom: 100,
          arrowTipDistance: 20.0,
          minimumOutsideMargin: 120,
          arrowBaseWidth: 20.0,
          arrowLength: 20.0,
          borderWidth: 0.0,
          boxShadows: [],
          borderColor: AppColors.cF8F992,
          touchThroughAreaShape: ClipAreaShape.rectangle,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AssetsIcons.help,
                      width: 24.w,
                      height: 24.h,
                      color: AppColors.black,
                    ),
                    UIHelper.horizontalSpace(6.w),
                    Flexible(
                      child: Text(
                        widget.title ?? 'Why We Collect This Information',
                        style: TextFontStyle.headline16w600c101010StyleInter
                            .copyWith(color: AppColors.black),
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                widget.content ??
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
                style: TextFontStyle.headline14w400white.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          child: Image.asset(AssetsIcons.help, width: 24.w, height: 24.h),
        ),
      ),
    );
  }
}


//Package: super_tooltip
