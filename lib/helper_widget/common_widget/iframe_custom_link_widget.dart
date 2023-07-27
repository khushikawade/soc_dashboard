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

  final String?
      dynamicLinkUrl; //============dynamicLinkUrl path==================
  const IFrameCustomWidget(
      {super.key,
      required this.titleText,
      required this.subTitleText,
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
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(
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
            pageTitleTextWidget(widget.titleText, AppUtil.getContext()),
            SizedBox(
              height: 47.h,
            ),
            headerTextWidget(widget.subTitleText, context),
            SizedBox(
              height: 66.h,
            ),
            Expanded(child: _iframeWidget!),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [

            //     Expanded(
            //       flex: 2,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [

            //           SizedBox(
            //             height: 30.h,
            //           ),
            //           detailTextWidget(widget.detailDescription, context),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
