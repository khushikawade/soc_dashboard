import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/shimmer_loading.dart';

class CustomIconMode extends StatefulWidget {
  late final String? iconUrl;

  final String? darkModeIconUrl;

  CustomIconMode({Key? key, @required this.iconUrl, this.darkModeIconUrl})
      : super(key: key);

  @override
  State<CustomIconMode> createState() => _CustomIconModeState();
}

class _CustomIconModeState extends State<CustomIconMode> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(child: cachedNetworkImage(widget.iconUrl)),
    );
  }

  Widget cachedNetworkImage(url) {
    return CachedNetworkImage(
        imageUrl: url,
        height: 106.h,
        width: 106.w,
        //fit: BoxFit.cover,
        placeholder: (context, url) => Container(
            alignment: Alignment.center,
            child: ShimmerLoading(
              isLoading: true,
              child: Container(
                height: 106.h,
                width: 106.w,
                color: Colors.white,
              ),
            )),
        errorWidget: (context, url, error) => CachedNetworkImage(
              imageUrl:
                  "https://solved-consulting-images.s3.us-east-2.amazonaws.com/Miscellaneous/default_icon.png",
              height: 106.h,
              width: 106.w,
              placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: ShimmerLoading(
                    isLoading: true,
                    child: Container(
                      height: 20,
                      width: 20,
                      color: Colors.white,
                    ),
                  )),
            ));
  }
}
