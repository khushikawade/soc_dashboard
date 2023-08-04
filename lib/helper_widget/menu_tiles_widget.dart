import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/hover_animation_widget.dart';
import 'package:solved_dashboard/models/nav_bar_model.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class MenuTilesWidget extends StatefulWidget {
  final Widget child;
  final int index;
  final bool hovered;
  final List<NavBarMenu> menuTiles;
  final List<NavBarModel> headerTiles;
  //final BoxDecoration menuBoxDecoration;
  final Color menuTextColor;
  final double menuTextSize;
  final HeaderPosition headerPosition;
  final AnimationType animationType;

  const MenuTilesWidget({
    Key? key,
    required this.menuTiles,
    required this.headerTiles,
    required this.child,
    required this.index,
    required this.hovered,
    //required this.menuBoxDecoration,
    required this.menuTextColor,
    required this.menuTextSize,
    required this.headerPosition,
    required this.animationType,
  }) : super(key: key);

  @override
  _MenuTilesWidgetState createState() => _MenuTilesWidgetState();
}

class _MenuTilesWidgetState extends State<MenuTilesWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey _globalKey = GlobalKey();
  final GlobalKey _globalKeyForMenu = GlobalKey();
  OverlayEntry? entry;
  OverlayEntry? subMenuOverlayEntry;
  List _menuHover = [];
  ScrollController controller = ScrollController();
  bool allowAddEntry = true;
  bool allowAddEntryForSubMenu = true;
  List<SubMenuData> subMenuList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _menuHover = List.filled(widget.headerTiles.length, false);
      entry = _overlayEntry();
      entry?.addListener(() {
        allowAddEntry = !allowAddEntry;
      });
      subMenuOverlayEntry = _overlayEntryForSubMenu();
      subMenuOverlayEntry?.addListener(() {
        allowAddEntryForSubMenu = !allowAddEntryForSubMenu;
      });
    });
  }

  ///Mouse region of header and perform animation according to it
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: true,
      onHover: (_) {
        if (allowAddEntry && !_menuHover[widget.index]) {
          _menuHover[widget.index] = true;
          _addOverlay(entry!);
        }
      },
      onExit: (_) {
        _menuHover[widget.index] = false;
        Future.delayed(const Duration(milliseconds: 100), () {
          if (!_menuHover[widget.index] && entry != null) {
            if (!entry!.mounted) {
              return;
            } else {
              entry?.remove();
            }
          }
        });
      },
      child: Container(
        key: _globalKey,
        child: widget.child,
      ),
    );
  }

  OverlayEntry _overlayEntry() {
    return OverlayEntry(builder: (BuildContext overlayContext) {
      final offset = _getPosition();
      return Positioned(
        top: 205.sp,
        left: offset.dx,
        child: ChangeNotifierProvider.value(
          value: ScrollEventNotifier(false, false),
          child: StatefulBuilder(
            builder: (context, setStateForOverlay) {
              return Material(
                color: Colors.transparent,
                child: MouseRegion(
                  onEnter: (_) {
                    if (!_menuHover[widget.index]) {
                      _menuHover[widget.index] = true;
                    }
                  },
                  onExit: (_) {
                    if (_menuHover[widget.index]) {
                      _menuHover[widget.index] = false;
                      setStateForOverlay(() {});
                    }
                  },
                  child: Column(
                    children: _buildListItems(),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }

  OverlayEntry _overlayEntryForSubMenu() {
    return OverlayEntry(builder: (BuildContext overlayContext) {
      final offset = _getPosition();
      return Positioned(
        top: offset.dy.sp + 100.sp,
        left: offset.dx.sp + 193.sp,
        child: ChangeNotifierProvider.value(
          value: ScrollEventNotifier(false, false),
          child: StatefulBuilder(
            builder: (context, setStateForOverlay) {
              return Material(
                color: Colors.transparent,
                child: Column(
                  children: _buildListItemsForSubMenu(),
                ),
                //),
              );
            },
          ),
        ),
      );
    });
  }

  ///Get position according to hover position
  Offset _getPosition() {
    final renderBox =
        _globalKey.currentContext!.findRenderObject() as RenderBox;
    return renderBox.localToGlobal(Offset.zero);
  }

  Offset _getPositionForSubMenu() {
    try {
      final renderBox =
          _globalKeyForMenu.currentContext!.findRenderObject() as RenderBox;
      return renderBox.localToGlobal(Offset.zero);
    } catch (e) {
      print("Error when getting offset position --------- $e");
    }
    return const Offset(100, 100);
  }

  ///Showing list with using curve and delay
  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (int index = 0; index < widget.menuTiles.length; ++index) {
      listItems.add(Container(
        width: 192.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 20.0.r,
              offset: const Offset(0, 20),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
            padding: EdgeInsets.only(
                left: 16.sp, right: 16.sp, top: 16.sp, bottom: 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(
                //   widget.menuTiles[i].imagePath!,
                //   height: 25.h,
                //   width: 25.w,
                // ),
                // SizedBox(
                //   width: 11.w,
                // ),
                Expanded(
                  child: MouseRegion(
                    opaque: true,
                    onHover: (_) {
                      // final offset = _getPositionForSubMenu();
                      // final offset = _getPosition();
                      // print("Tapped value dx ---------------- ${offset.dx}");
                      // print("Tapped value dy ---------------- ${offset.dy}");
                      subMenuList.clear();
                      setState(() {
                        if (widget.menuTiles != null &&
                            widget.menuTiles.isNotEmpty) {
                          if (widget.menuTiles[index].subMenu != null &&
                              widget.menuTiles[index].subMenu!.isNotEmpty) {
                            subMenuList
                                .addAll(widget.menuTiles[index].subMenu!);
                          }
                        }
                      });
                      if (allowAddEntryForSubMenu) {
                        // _menuHover[widget.index] = true;
                        _addOverlay(subMenuOverlayEntry!);
                      }
                    },
                    onExit: (_) {
                      //_menuHover[widget.index] = false;
                      Future.delayed(const Duration(milliseconds: 100), () {
                        if (subMenuOverlayEntry != null) {
                          if (!subMenuOverlayEntry!.mounted) {
                            return;
                          } else {
                            subMenuOverlayEntry?.remove();
                          }
                        }
                      });
                    },
                    child: subMenuTitleWidget(
                        widget.menuTiles[index].menuTitle ?? '', context),
                  ),
                ),
                SizedBox(
                  width: widget.menuTiles[index].icon != null ? 16.sp : 0,
                ),
                widget.menuTiles[index].icon != null
                    ? Icon(
                        widget.menuTiles[index].icon,
                        color: AppColors.tabBarSelectedBG,
                        size: 24.sp,
                      )
                    : Container(
                        width: 0,
                        height: 0,
                      ),
              ],
            )),
      ));
    }
    return listItems;
  }

  List<Widget> _buildListItemsForSubMenu() {
    final listItems = <Widget>[];
    for (int index = 0; index < subMenuList.length; ++index) {
      listItems.add(Container(
        //key: _globalKeyForMenu,
        width: 192.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 20.0.r,
              offset: const Offset(0, 20),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
            padding: EdgeInsets.only(
                left: 16.sp, right: 16.sp, top: 16.sp, bottom: 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(
                //   widget.menuTiles[i].imagePath!,
                //   height: 25.h,
                //   width: 25.w,
                // ),
                // SizedBox(
                //   width: 11.w,
                // ),
                Expanded(
                  child: subMenuTitleWidget(
                      subMenuList[index].subMenuTitle ?? '', context),
                ),
                SizedBox(
                  width: subMenuList[index].icon != null ? 16.sp : 0,
                ),
                subMenuList[index].icon != null
                    ? Icon(
                        subMenuList[index].icon,
                        color: AppColors.tabBarSelectedBG,
                        size: 24.sp,
                      )
                    : Container(
                        width: 0,
                        height: 0,
                      ),
              ],
            )),
      ));
    }
    return listItems;
  }

  ///Add overlay using it's entry
  _addOverlay(OverlayEntry entry) {
    Overlay.of(context)?.insert(entry);
  }
}

///It will help to notify widget and update tree
class ScrollEventNotifier extends ChangeNotifier {
  ScrollEventNotifier(this._isScrolling, this._isReverseScrolling);

  bool _isScrolling = false;
  bool _isReverseScrolling = false;

  bool get isScrolling => _isScrolling;

  set isScrolling(bool scroll) {
    _isScrolling = scroll;
    notifyListeners();
  }

  bool get isReverseScrolling => _isReverseScrolling;

  set isReverseScrolling(bool scroll) {
    _isReverseScrolling = scroll;
    notifyListeners();
  }
}
