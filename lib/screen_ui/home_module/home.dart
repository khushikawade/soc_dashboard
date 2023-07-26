import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/information_graph_card.dart';
import 'package:solved_dashboard/utils/app_util.dart';

import '../../helper_widget/common_widget/one_column_text_and_image_right.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(Object context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 190.sp, right: 190.sp, top: 36.sp),
        children: [
          pageTitleTextWidget(
              'Latest Dashboard Features', AppUtil.getContext()),
          SizedBox(
            height: 42.h,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   mainAxisSize: MainAxisSize.max,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     informationGraphCard(
          //         'Grades & Report Cards', '', 'assets/tabel.png')
          //   ],
          // ),
          OneColumnTextAndImageRightWidget(
            titleText: "Title Here",
            subTitleText: "Praesent lobortis metus ex.",
            detailDescription:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n\na ut placerat libero. In sed lorem at turpis cursus imperdiet nec at dui. Aenean tortor mauris, consequat non imperdiet vel, tristique nec urna. Mauris et imperdiet ligula, imperdiet lacinia leo. Curabitur dictum velit \n\nvarius, viverra magna nec, tempus lacus. Pellentesque mollis nisi ut tellus feugiat fringilla. Morbi diam justo, convallis non augue sed, sagittis condimentum orci. Proin rutrum turpis non massa pharetra, non mattis nisi vulputate.\nEtiam hendrerit dui vel enim dignissim tempus. Pellentesque hendrerit enim sodales, commodo sapien sed, hendrerit mi. Integer facilisis mauris a nunc euismod, id fermentum",
            imageUrl:
                "https://s3-alpha-sig.figma.com/img/d78c/cb1f/2bedc8d8bf4cfce811469c0e9d05c7f8?Expires=1691366400&Signature=et-U8SEdeh41abh31WGCOLuvCZZ42ZqDyZhNiRxt2NKS8MY3H9oi7fXhXER8DSJBHRqNKStRrlFpi-MQdRVtjhr4jxHxBRjwTtov6zT0UTRE8dwuDDvGkVsFJgYemxyEB1IGQTiwTwxc6kjxse~JZLIJhFaFadDaXXb8guSdexF7Y4pioOrezkcXEzGZJ6UT9aki-xEFe1u5uEJk6BEG5851AkO2tDYHAQimuf5zePiJhNhGxifQDTy3LQM7KmlzCoavAZ~dQ1sD7YimIg7Q1hi846Deg7oi0QZRER31cJtCHg6uY8YPpRRqDciQt7Ddw2q9nMrdKM5m1Rr1lyx-Ng__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
          )
        ],
      ),
    );
  }
}
