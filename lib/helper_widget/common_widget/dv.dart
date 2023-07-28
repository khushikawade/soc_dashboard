import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'dart:html';

class StudentPlusWebDashBoard extends StatefulWidget {
  const StudentPlusWebDashBoard({Key? key}) : super(key: key);

  @override
  State<StudentPlusWebDashBoard> createState() =>
      _StudentPlusWebDashBoardState();
}

class _StudentPlusWebDashBoardState extends State<StudentPlusWebDashBoard> {
  final IFrameElement _iframeElement = IFrameElement();

  Widget? _iframeWidget;
  @override
  void initState() {
    _iframeElement.height = '100%';
    _iframeElement.width = '100%';
    _iframeElement.src =
        'https://lookerstudio.google.com/embed/reporting/79858477-b28e-42ea-b747-44714c74a3a2/page/X5mKD';
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
    return Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: _iframeWidget!);
  }

  // Widget _iframeWidget() {
  //   return HtmlElementView(
  //     key: UniqueKey(),
  //     viewType: 'iframeElement',
  //   );
  // }
}
