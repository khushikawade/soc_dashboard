import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'dart:ui' as ui;
import 'dart:html';
import 'package:solved_dashboard/utils/app_colors.dart';
import 'package:solved_dashboard/utils/app_util.dart';

class IFrameCustomWidget extends StatefulWidget {
  final String? titleText; //============title text==================
  final String? subTitleText; //============subtitle text==================
  final double? customContainerHeight;
  final double? customContainerWidth;
  final EdgeInsetsGeometry?
      padding; //=====================manage custom padding ===================
  final double?
      height; // ==========================manage custom height above iframe link ==============
  final String?
      dynamicLinkUrl; //============dynamicLinkUrl path==================
  const IFrameCustomWidget(
      {super.key,
      this.titleText,
      this.subTitleText,
      this.padding,
      this.height,
      this.customContainerHeight,
      this.customContainerWidth,
      required this.dynamicLinkUrl});

  @override
  State<IFrameCustomWidget> createState() => _IFrameCustomWidgetState();
}

class _IFrameCustomWidgetState extends State<IFrameCustomWidget> {
  final IFrameElement _iframeElement = IFrameElement();

  Widget? _iframeWidget;
  @override
  void initState() {
    _iframeElement.src = widget.dynamicLinkUrl;
    _iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );
    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('url is ${widget.dynamicLinkUrl}');
    return SelectionArea(
      child: Container(
        height: widget.customContainerHeight ?? double.infinity,
        width: widget.customContainerWidth ?? double.infinity,
        padding: widget.padding ??
            EdgeInsets.only(
              left: 189.w,
              top: 58.h,
              bottom: 60.h,
              right: 189.w,
            ),
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.titleText != null && widget.titleText!.isNotEmpty
                ? pageTitleTextWidget(widget.titleText, AppUtil.getContext())
                : const SizedBox.shrink(),
            widget.titleText != null && widget.titleText!.isNotEmpty
                ? SizedBox(
                    height: 47.h,
                  )
                : const SizedBox.shrink(),
            widget.subTitleText != null && widget.subTitleText!.isNotEmpty
                ? headerTextWidget(widget.subTitleText, context)
                : const SizedBox.shrink(),
            SizedBox(
              height: widget.height ?? 66.h,
            ),
            Expanded(child: _iframeWidget!),
          ],
        ),
      ),
    );
  }
}
