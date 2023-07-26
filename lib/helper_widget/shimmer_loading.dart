// ignore: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class ShimmerLoading extends StatelessWidget {
  final child;

  bool? isLoading = false;

  ShimmerLoading({Key? key, @required this.child, @required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading!
        ? Shimmer.fromColors(
            baseColor: AppColors.kShimmerBaseColor!,
            highlightColor: AppColors.kShimmerHighlightColor!,
            enabled: true,
            child: child!)
        : child;
  }
}
