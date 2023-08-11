import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/debounce.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/hover_animation_widget.dart';
import 'package:solved_dashboard/helper_widget/vertical_divider_widget.dart';
import 'package:solved_dashboard/models/nav_bar_model.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class MenuTilesWidget extends StatefulWidget {
  final Widget child;
  final int index;
  final bool hoverValue;
  final List<NavBarMenu> menuTiles;
  final List<NavBarModel> headerTiles;
  //final BoxDecoration menuBoxDecoration;
  final Color menuTextColor;
  final double menuTextSize;
  final HeaderPosition headerPosition;
  final AnimationType animationType;
  final Function(String headerTitle, String mainSection, String subSection)?
      receiveValue;

  const MenuTilesWidget(
      {Key? key,
      required this.menuTiles,
      required this.headerTiles,
      required this.child,
      required this.index,
      required this.hoverValue,
      //required this.menuBoxDecoration,
      required this.menuTextColor,
      required this.menuTextSize,
      required this.headerPosition,
      required this.animationType,
      this.receiveValue})
      : super(key: key);

  @override
  _MenuTilesWidgetState createState() => _MenuTilesWidgetState();
}

class _MenuTilesWidgetState extends State<MenuTilesWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey _globalKey = GlobalKey();
  Offset setOffsetFormMenu = Offset.zero;
  //final GlobalKey _globalKeyForMenu = GlobalKey();
  OverlayEntry? entry;
  OverlayEntry? subMenuOverlayEntry;
  List _menuHover = [];
  ScrollController controller = ScrollController();
  bool allowAddEntry = true;
  bool allowAddEntryForSubMenu = true;
  final ValueNotifier<Offset> _hoverOffset = ValueNotifier<Offset>(Offset.zero);
  // Offset _hoverOffset = Offset.zero;
  List<SubMenuData> subMenuList = List.empty(growable: true);
  Offset subMenuOffset = Offset.zero;
  final ValueNotifier<Offset> menuOffset = ValueNotifier<Offset>(Offset.zero);
  String? getTitle;
  String? menuTitle;
  List<GlobalKey>? _listItemKeys;

  bool _hasHovered = false;

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
      print(subMenuOverlayEntry);
      // subMenuOverlayEntry?.addListener(() {
      //   allowAddEntryForSubMenu = !allowAddEntryForSubMenu;
      // });
    });
  }

  Offset _getListItemPosition(int item, int index) {
    if (_hasHovered) {
      // _debouncer.run(() {

      _hoverOffset.value = Offset.zero;
      if (_listItemKeys == null) {
        setState(() {
          _listItemKeys = List.generate(item, (index) => GlobalKey());
        });
      }

      final RenderBox? renderBox = _listItemKeys?[index]
          .currentContext
          ?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        subMenuOffset = renderBox.localToGlobal(Offset.zero);
        // subMenuOffset = listItemPosition;
        setState(() {
          _hasHovered = true;
        });

        print("Item $index Position: ${subMenuOffset.dx}, ${subMenuOffset.dy}");
      }

      //});
    }

    return subMenuOffset;
  }

  ///Mouse region of header and perform animation according to it
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: true,
      onHover: (_) {
        menuOffset.value = Offset.zero;
        _getPosition();

        if (allowAddEntry && !_menuHover[widget.index]) {
          setState(() {
            _menuHover[widget.index] = true;
            _addOverlay(entry!);
            _hoverOffset.value = Offset.zero;
          });
        }
      },
      onExit: (_) {
        //exit for main tabar
        setState(() {
          print(_hoverOffset.value);

          _hasHovered = false;
          _hoverOffset.value = Offset.zero;

          // print(widget.index);
          // print(widget.menuTiles);

          _menuHover[widget.index] = false;

          // clearListExceptCurrentIndex(widget.menuTiles, widget.index);
        });

        Future.delayed(const Duration(milliseconds: 100), () {
          if (!_menuHover[widget.index] && entry != null) {
            if (!entry!.mounted) {
              print("truetreyyryeddgsdtruetreyyryeddgsd");
              return;
            } else {
              setState(() {});

              entry?.remove();
            }
          }
        });

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
      child: Container(
        key: _globalKey,
        child: widget.child,
      ),
    );
  }

  OverlayEntry _overlayEntry() {
    return OverlayEntry(builder: (BuildContext overlayContext) {
      // _getPosition();
      return ValueListenableBuilder<Offset>(
          valueListenable: _hoverOffset,
          builder: (context, value, child) => Positioned(
                top: menuOffset.value.dy + 69.h, //205.sp,
                left: menuOffset.value.dx,
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
                            if (widget.headerTiles != null &&
                                widget.headerTiles.isNotEmpty) {
                              widget.headerTiles.forEach((element) {
                                if (element.isSelcted!) {
                                  getTitle = element.title!;
                                }
                              });
                            }
                          },
                          onExit: (_) {
                            if (_menuHover[widget.index] && !_hasHovered) {
                              _menuHover[widget.index] = false;
                              Future.delayed(const Duration(milliseconds: 100),
                                  () {
                                print(
                                    "FDFFFFFFFFFFFFFFFFFFFF${_hoverOffset.value}");
                                print(
                                    "FDFFFFFFFFFFFFFFFFFFFF${_hoverOffset.value}");
                                if (!_menuHover[widget.index] &&
                                    entry != null) {
                                  if (!entry!.mounted) {
                                    print("truetreyyryeddgsdtruetreyyryeddgsd");
                                    return;
                                  } else {
                                    setState(() {});

                                    entry?.remove();
                                  }
                                }
                              });
                              setStateForOverlay(() {});
                            }
                          },
                          child: Container(
                              color: AppColors.whiteColor,
                              child: Column(children: _buildListItems())),
                        ),
                      );
                    },
                  ),
                ),
              ));
    });
  }

  OverlayEntry _overlayEntryForSubMenu() {
    return OverlayEntry(builder: (BuildContext overlayContext) {
      return ValueListenableBuilder<Offset>(
        valueListenable: _hoverOffset,
        builder: (context, value, child) => Positioned(
          top: _hoverOffset.value.dy - 1.sp, //offset.dy
          // +
          // 100.sp,
          left: _hoverOffset.value.dx + 192.sp, //offset.dx
          // bottom: 4.sp,
          // +
          // 193.sp,
          child: ChangeNotifierProvider.value(
            value: ScrollEventNotifier(false, false),
            child: StatefulBuilder(
              builder: (context, setStateForOverlay) {
                return Material(
                  color: Colors.transparent,
                  child: _hoverOffset.value != Offset.zero
                      ? Container(
                          color: AppColors.whiteColor,
                          child: Column(
                            children: _buildListItemsForSubMenu(),
                          ),
                        )
                      : const SizedBox.shrink(),
                  //),
                );
              },
            ),
          ),
        ),
      );

      //   child: Positioned(
      //       top: _hoverOffset.dy.sp - 1.sp, //offset.dy
      //       // +
      //       // 100.sp,
      //       left: _hoverOffset.dx.sp + 192.sp, //offset.dx
      //       // bottom: 4.sp,
      //       // +
      //       // 193.sp,
      //       child: ChangeNotifierProvider.value(
      //         value: ScrollEventNotifier(false, false),
      //         child: StatefulBuilder(
      //           builder: (context, setStateForOverlay) {
      //             return Material(
      //               color: Colors.transparent,
      //               child: Column(
      //                 children: _buildListItemsForSubMenu(),
      //               ),
      //               //),
      //             );
      //           },
      //         ),
      //       ),
      //     ),

      // )
      // : const SizedBox.shrink();
    });
  }

  ///Get position according to hover position
  Offset _getPosition() {
    final renderBox =
        _globalKey.currentContext!.findRenderObject() as RenderBox;
    menuOffset.value = renderBox.localToGlobal(Offset.zero);
    print("Item  Position: ${menuOffset.value.dx}, ${menuOffset.value.dy}");
    return menuOffset.value;
  }

  // _getPositionForSubMenu() {
  //   if (_globalKeyForMenu.currentContext != null) {
  //     try {
  //       final RenderBox renderBox =
  //           _globalKeyForMenu.currentContext?.findRenderObject() as RenderBox;
  //       if (renderBox != null) {
  //         setState(() {
  //           subMenuOffset = renderBox.localToGlobal(Offset.zero);
  //         });
  //       }
  //     } catch (e) {
  //       print("Error when getting offset position --------- $e");
  //     }
  //   } else {
  //     return const Offset(100, 100);
  //   }
  // }

  ///Showing list with using curve and delay
  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (int index = 0; index < widget.menuTiles.length; ++index) {
      listItems.add(InkWell(
        onTap: () {
          if (subMenuList.isEmpty) {
            String tabTitle = '';
            if (widget.headerTiles != null && widget.headerTiles.isNotEmpty) {
              widget.headerTiles.forEach((element) {
                if (element.isSelcted!) {
                  tabTitle = element.title!;
                }
              });
            }
            widget.receiveValue!(
                widget.menuTiles[index].menuTitle!, tabTitle, '');
          }
        },
        child: Column(
          children: [
            MouseRegion(
              opaque: true,
              onHover: //_handleHover,
                  (PointerHoverEvent event) {
                // _handleHover(event);
                // subMenuOffset = Offset(0, 0);

                subMenuList.clear();

                setState(() {
                  widget.menuTiles[index].isSelected = true;
                  if (widget.menuTiles != null && widget.menuTiles.isNotEmpty) {
                    if (widget.menuTiles[index].subMenu != null &&
                        widget.menuTiles[index].subMenu!.isNotEmpty) {
                      subMenuList.addAll(widget.menuTiles[index].subMenu!);
                    }
                  }
                });
                menuTitle = widget.menuTiles[index].menuTitle;

                print("++++++++++++++++++++++++++$menuTitle");
                print("++++++++++++++++++++++++++$menuTitle");
                print("============getIndex=========================$index");
                print(
                    "============getList=========================${widget.menuTiles.length}");

                if (allowAddEntryForSubMenu) {
                  // _menuHover[widget.index] = true;

                  if (widget.menuTiles[index].subMenu != null &&
                      widget.menuTiles[index].subMenu!.isNotEmpty) {
                    _hasHovered = true;

                    Offset getOffset =
                        _getListItemPosition(widget.menuTiles.length, index);
                    setState(() {});
                    print(
                        "===========$index=====getOffset=============$getOffset");

                    _hoverOffset.value = getOffset;
                    setOffsetFormMenu = _hoverOffset.value;
                  }
                  _addOverlay(subMenuOverlayEntry!);
                }
              },
              onExit: (_) {
                // _hoverOffset.value = Offset.zero;
                if (subMenuList.isEmpty) {
                  _hoverOffset.value = Offset.zero;
                  _hasHovered = false;
                }

                setState(() {
                  widget.menuTiles[index].isSelected = false;
                });
                //_menuHover[widget.index] = true;
                if (subMenuList.isEmpty) {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    if (subMenuOverlayEntry != null) {
                      if (!subMenuOverlayEntry!.mounted) {
                        return;
                      } else {
                        subMenuOverlayEntry?.remove();
                      }
                    }
                  });
                } else {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    if (subMenuOverlayEntry != null) {
                      if (!subMenuOverlayEntry!.mounted) {
                        return;
                      } else {
                        //subMenuOverlayEntry?.remove();
                      }
                    }
                  });
                }
              },
              child: Container(
                key: _listItemKeys != null ? _listItemKeys![index] : null,
                padding: EdgeInsets.only(
                    left: 16.w, right: 16.w, top: 16.h, bottom: 16.h),
                width: 192.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.menuTiles[index].isSelected != null &&
                          widget.menuTiles[index].isSelected == true
                      ? AppColors.tabBarSelectedBG
                      : AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.1),
                      blurRadius: 20.0.r,
                      offset: const Offset(0, 20),
                      spreadRadius: 0,
                    ),
                  ],
                ),
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
                      child: Container(
                        // key: _listItemKeys != null
                        //     ? _listItemKeys![index]
                        //     : null,
                        child: subMenuTitleWidget(
                            widget.menuTiles[index].menuTitle ?? '',
                            context,
                            widget.menuTiles[index].isSelected!),
                      ),
                    ),
                    SizedBox(
                      width: widget.menuTiles[index].icon != null ? 16.sp : 0,
                    ),
                    widget.menuTiles[index].icon != null
                        ? Icon(
                            widget.menuTiles[index].icon,
                            color: widget.menuTiles[index].isSelected == true
                                ? AppColors.whiteColor
                                : AppColors.tabBarSelectedBG,
                            size: 24.sp,
                          )
                        : Container(
                            width: 0,
                            height: 0,
                          ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1.h,
              width: 192.w,
              color: AppColors.tabBarDivider,
            )
          ],
        ),
      ));
    }
    return listItems;
  }

  List<Widget> _buildListItemsForSubMenu() {
    // print(
    //     "++++++++++++++++++++++++++++++++++++++++++++++++${_globalKeyForMenu}+++++++++++");
    // print(
    //     "++++++++++++++++++++++++++++++++++++++++++++++++${_globalKeyForMenu}+++++++++++");
    final listItems = <Widget>[];
    for (int index = 0; index < subMenuList.length; ++index) {
      listItems.add(Column(
        children: [
          InkWell(
            onTap: () {
              print("Submenu item tapped: ${subMenuList[index].subMenuTitle}");
              String tabTitle = '';
              String? getsubTitle;
              if (subMenuList.isNotEmpty && widget.headerTiles.isNotEmpty) {
                // subMenuList.forEach((element) {
                tabTitle = subMenuList[index].subMenuTitle!;

                print(getsubTitle);

                print(getTitle);
                widget.receiveValue!(subMenuList[index].subMenuTitle!,
                    getTitle ?? '', menuTitle ?? '');

                //  });
              }

              setState(() {
                _hasHovered = false;
                _hoverOffset.value = Offset.zero;

                // setOffsetFormMenu = Offset.zero;
              });
            },
            child: Container(
              //key: _globalKeyForMenu[index],
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
                        child: Container(
                          child: subMenuTitleWidget(
                              subMenuList[index].subMenuTitle ?? '',
                              context,
                              false),
                        ),
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
            ),
          ),
          Container(
            height: 1.h,
            width: 192.w,
            color: AppColors.tabBarDivider,
          )
        ],
      ));
    }
    return listItems;
  }

  ///Add overlay using it's entry
  _addOverlay(OverlayEntry entry) {
    Overlay.of(context).insert(entry);
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
