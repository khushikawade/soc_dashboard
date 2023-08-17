import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solved_dashboard/custom_fonts/solved_dashboard_icons_icons.dart';
import 'package:solved_dashboard/helper_widget/menu_tiles_widget.dart';
import 'package:solved_dashboard/helper_widget/tabbar_item_widget.dart';
import 'package:solved_dashboard/helper_widget/vertical_divider_widget.dart';
import 'package:solved_dashboard/models/nav_bar_model.dart';

class AnimatedHoverMenu extends StatefulWidget {
  ///Header properties
  final List<NavBarModel> headerTiles;
  final BoxDecoration? headerBoxDecoration;
  final Color? headerTextColor;
  final double? headerTextSize;
  final Function(String headerTitle, String mainSection, String subSection,
      String selectedId)? receiveValue;

  ///Menu properties

  final BoxDecoration? menuBoxDecoration;
  final Color? menuTextColor;
  final double? menuTextSize;

  ///The type of animation
  final AnimationType? animationType;

  ///Header menu position
  final HeaderPosition headerPosition;

  ///Background gradient
  final Widget? backgroundWidget;

  AnimatedHoverMenu(
      {Key? key,
      required this.headerTiles,

      //required this.menuTiles,
      required this.headerPosition,
      this.backgroundWidget,
      this.headerBoxDecoration,
      this.headerTextColor,
      this.headerTextSize,
      this.menuBoxDecoration,
      this.menuTextColor,
      this.menuTextSize,
      this.animationType,
      this.receiveValue})
      : super(key: key);

  @override
  _AnimatedHoverMenuState createState() => _AnimatedHoverMenuState();
}

class _AnimatedHoverMenuState extends State<AnimatedHoverMenu>
    with SingleTickerProviderStateMixin {
  bool hovered = false;
  List<NavBarMenu> menuList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return _defineHeaderPosition(widget.headerPosition);
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
          return InkWell(
            onTap: () {
              widget.receiveValue!('', widget.headerTiles[index].title!, '',
                  widget.headerTiles[index].id.toString());
            },
            child: MouseRegion(
              opaque: true,
              // onHover: (event) {
              //   hovered = true;
              // },
              onEnter: (PointerEnterEvent pointerEnterEvent) {
                widget.headerTiles.forEach(
                  (element) {
                    if (element.isSelcted!) {
                      element.isSelcted = false;
                    }
                  },
                );
                setState(() {
                  widget.headerTiles[index].isSelcted = true;
                  hovered = true;
                  if (widget.headerTiles[index].menuOptions != null &&
                      widget.headerTiles[index].menuOptions!.isNotEmpty) {
                    if (widget.headerTiles[index].dropDownIcon != null &&
                        widget.headerTiles[index].menuOptions != null) {
                      menuList.clear();
                      menuList.addAll(widget.headerTiles[index].menuOptions!);
                    } else {
                      menuList.clear();
                    }
                  } else {
                    menuList.clear();
                  }
                });
                print(menuList);
                print(menuList);
              },
              onExit: (PointerExitEvent pointerExitEvent) {
                setState(() {
                  // widget.headerTiles.forEach(
                  //   (element) {
                  //     if (element.isSelcted!) {
                  //       element.isSelcted = false;
                  //     }
                  //   },
                  // );
                  if (widget.headerTiles[index].menuOptions == null ||
                      widget.headerTiles[index].menuOptions!.isEmpty) {
                    widget.headerTiles[index].isSelcted = false;

                    widget.headerTiles[0].isSelcted = true;
                  }

                  // Set the isSelcted of the first element (index 0) to true

                  hovered = false;
                  if (widget.headerTiles[index].menuOptions == null ||
                      widget.headerTiles[index].menuOptions!.isEmpty) {
                    menuList.clear();
                  }
                });
                print(menuList);
                print(menuList);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 192.w, //192.w
                    child: MenuTilesWidget(
                      menuTiles: menuList,
                      receiveValue: (headerTitle, mainSection, subSection) {
                        widget.receiveValue!(
                            headerTitle, mainSection, subSection, '');
                      },
                      // receiveValue: (menuTitle, tabTitle,) {
                      //   widget.receiveValue!(menuTitle, tabTitle);
                      // },
                      headerTiles: widget.headerTiles,
                      index: index,
                      hoverValue: hovered,
                      menuTextColor: widget.menuTextColor ?? Colors.white,
                      menuTextSize: widget.menuTextSize ?? 16.0,
                      headerPosition: widget.headerPosition,
                      animationType:
                          widget.animationType ?? AnimationType.leftToRight,
                      child: tabBarItemWidget(
                          widget.headerTiles[index].title ?? '',
                          widget.headerTiles[index].isSelcted!,
                          widget.headerTiles[index].icon,
                          context,
                          dropDownIcon: widget.headerTiles[index].dropDownIcon),
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

                  //==================sayyam=====================
                  verticalDivider(),
                ],
              ),
            ),
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
  IconData? dropDownIcon;

  Menu({this.id, this.name, this.iconName, this.isSelected, this.dropDownIcon});

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
  String? imagePath;

  SubMenu({this.id, this.name, this.imagePath});

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubMenu &&
          runtimeType == other.runtimeType &&
          name == other.name;
}
