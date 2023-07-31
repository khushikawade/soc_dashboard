import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/custom_fonts/solved_dashboard_icons_icons.dart';
import 'package:solved_dashboard/helper_widget/menu_tiles_widget.dart';
import 'package:solved_dashboard/helper_widget/tabbar_item_widget.dart';
import 'package:solved_dashboard/helper_widget/vertical_divider_widget.dart';

class AnimatedHoverMenu extends StatefulWidget {
  ///Header properties
  final List<Menu> headerTiles;
  final BoxDecoration? headerBoxDecoration;
  final Color? headerTextColor;
  final double? headerTextSize;

  ///Menu properties
  final List<SubMenu> menuTiles;
  final BoxDecoration? menuBoxDecoration;
  final Color? menuTextColor;
  final double? menuTextSize;

  ///The type of animation
  final AnimationType? animationType;

  ///Header menu position
  final HeaderPosition headerPosition;

  ///Background gradient
  final Widget? backgroundWidget;

  AnimatedHoverMenu({
    Key? key,
    required this.headerTiles,
    required this.menuTiles,
    required this.headerPosition,
    this.backgroundWidget,
    this.headerBoxDecoration,
    this.headerTextColor,
    this.headerTextSize,
    this.menuBoxDecoration,
    this.menuTextColor,
    this.menuTextSize,
    this.animationType,
  }) : super(key: key);

  @override
  _AnimatedHoverMenuState createState() => _AnimatedHoverMenuState();
}

class _AnimatedHoverMenuState extends State<AnimatedHoverMenu>
    with SingleTickerProviderStateMixin {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: true,
      onEnter: (PointerEnterEvent pointerEnterEvent) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (PointerExitEvent pointerExitEvent) {
        setState(() {
          hovered = false;
        });
      },
      child:
          // Stack(
          //   alignment: Alignment.topRight,
          //   children: [
          //widget.backgroundWidget ??
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //       colors: [
          //         Color(0xfffff8f9),
          //         Color(0xfffef7f8),
          //         Color(0xffecf0fa),
          //       ],
          //     ),
          //   ),
          // ),
          _defineHeaderPosition(widget.headerPosition),
      //   ],
      // )
    );
  }

  ///Here we are bifurcating animation type and according to that we have set it's alignment
  Widget _defineHeaderPosition(HeaderPosition headerPosition) {
    if (headerPosition == HeaderPosition.topLeft) {
      return _headerMenuWidget();
    } else if (headerPosition == HeaderPosition.bottomLeft) {
      return Container(
        alignment: Alignment.bottomLeft,
        child: _headerMenuWidget(),
      );
    } else if (headerPosition == HeaderPosition.topRight) {
      return _headerMenuWidget();
    } else if (headerPosition == HeaderPosition.bottomRight) {
      return Container(
        alignment: Alignment.bottomRight,
        child: _headerMenuWidget(),
      );
    } else {
      return const Offstage();
    }
  }

  ///It will return header menu list
  Widget _headerMenuWidget() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.headerTiles.length,
        shrinkWrap:
            widget.headerPosition == HeaderPosition.topLeft ? true : true,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 192.w,
                child: MenuTilesWidget(
                  menuTiles: widget.menuTiles,
                  headerTiles: widget.headerTiles,
                  index: index,
                  hovered: hovered,
                  // menuBoxDecoration: widget.menuBoxDecoration ??
                  //     const BoxDecoration(
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(7.0),
                  //         ),
                  //         color: Colors.black38),
                  menuTextColor: widget.menuTextColor ?? Colors.white,
                  menuTextSize: widget.menuTextSize ?? 16.0,
                  headerPosition: widget.headerPosition,
                  animationType:
                      widget.animationType ?? AnimationType.leftToRight,
                  child: tabBarItemWidget(
                      widget.headerTiles[index].name ?? '',
                      widget.headerTiles[index].isSelected!,
                      widget.headerTiles[index].iconName,
                      context),
                  // Container(
                  //   width: 190,
                  //   //margin: const EdgeInsets.only(left: 10.0),
                  //   decoration: widget.headerBoxDecoration ??
                  //       const BoxDecoration(
                  //           borderRadius: BorderRadius.all(
                  //             Radius.circular(5.0),
                  //           ),
                  //           color: Colors.black),
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     widget.headerTiles[index].name ?? '',
                  //     textAlign: TextAlign.left,
                  //     style: TextStyle(
                  //         fontSize: widget.headerTextSize ?? 15.0,
                  //         fontWeight: FontWeight.w500,
                  //         color: widget.headerTextColor ?? Colors.white),
                  //   ),
                  // ),
                ),
              ),
              verticalDivider(),
            ],
          );
        });
  }
}

///Below all are corner types
enum HeaderPosition {
  topLeft,
  bottomLeft,
  topRight,
  bottomRight,
}

///Below all are animation type
enum AnimationType {
  rightToLeft,
  leftToRight,
  topToBottom,
  centerToTop,
  springAcrossAxis,
  swingAcrossAxis,
}

class Menu {
  int? id;
  String? name;
  IconData? iconName;
  bool? isSelected;

  Menu({this.id, this.name, this.iconName, this.isSelected});

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Menu && runtimeType == other.runtimeType && name == other.name;
}

class SubMenu {
  int? id;
  String? name;

  SubMenu({this.id, this.name});

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubMenu &&
          runtimeType == other.runtimeType &&
          name == other.name;
}
