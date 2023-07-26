import 'package:flutter/material.dart';

class VerticalSpacerWidget extends StatelessWidget {
  final double? height;
  VerticalSpacerWidget(this.height);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}