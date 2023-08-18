import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/shimmer_loading.dart';

class CustomImage extends StatefulWidget {
  late final String? iconUrl;
  final double? height;
  final double? width;
  final String? darkModeIconUrl;
  final String? imagepath;

  CustomImage(
      {Key? key,
      this.iconUrl,
      this.darkModeIconUrl,
      this.height,
      this.width,
      this.imagepath})
      : super(key: key);

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          child: cachedNetworkImage(
        widget.iconUrl,
        widget.height,
        widget.width,
      )),
    );
  }

  Widget cachedNetworkImage(url, double? height, double? width) {
    return url!.contains("https")
        ? CachedNetworkImage(
            imageUrl: url,
            // height: height ?? 106.h,
            // width: width ?? 106.w,
            fit: BoxFit.fill,
            placeholder: (context, url) => Container(
                alignment: Alignment.center,
                child: ShimmerLoading(
                  isLoading: true,
                  child: Container(
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
                ))
        : Image.asset(
            url,
            width: 443.w,
            fit: BoxFit.cover,
          );
  }
}
