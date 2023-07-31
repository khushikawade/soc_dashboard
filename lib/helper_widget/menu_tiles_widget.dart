import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:solved_dashboard/helper_widget/heading_widget.dart';
import 'package:solved_dashboard/helper_widget/hover_animation_widget.dart';
import 'package:solved_dashboard/utils/app_colors.dart';

class MenuTilesWidget extends StatefulWidget {
  final Widget child;
  final int index;
  final bool hovered;
  final List<SubMenu> menuTiles;
  final List<Menu> headerTiles;
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
  OverlayEntry? entry;
  List _menuHover = [];
  ScrollController controller = ScrollController();
  bool allowAddEntry = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _menuHover = List.filled(widget.headerTiles.length, false);
      entry = _overlayEntry();
      entry?.addListener(() {
        allowAddEntry = !allowAddEntry;
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

  ///Adding overlay entry
  OverlayEntry _overlayEntry() {
    return OverlayEntry(builder: (BuildContext overlayContext) {
      final offset = _getPosition();
      return Positioned(
        top: 195.sp,
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
                  child: SizedBox(
                    height: 400,
                    child: SingleChildScrollView(
                      controller: controller,
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: _buildListItems(),
                      ),
                    ),
                  ),
                ),
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

  ///Showing list with using curve and delay
  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (int i = 0; i < widget.menuTiles.length; ++i) {
      listItems.add(
        FutureBuilder(
            future: Future.delayed(Duration(milliseconds: (i * 200))),
            builder: (context, value) {
              if (value.connectionState == ConnectionState.done) {
                return TweenAnimationBuilder(
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 200),
                  onEnd: () {
                    if (entry != null && !_menuHover[widget.index]) {
                      if (!entry!.mounted) {
                        return;
                      } else {
                        entry!.remove();
                      }
                    }
                  },
                  tween: _menuHover[widget.index]
                      ? Tween<double>(begin: 1, end: 0)
                      : Tween<double>(begin: 0, end: 1),
                  builder: (_, double value, _child) {
                    return _defineAnimationType(
                        widget.animationType, value, _child, i);
                  },
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("You Tapped On ${widget.menuTiles[i]}"),
                          duration: const Duration(milliseconds: 500)));
                    },
                    child: Container(
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
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                widget.menuTiles[i].imagePath!,
                                height: 25.h,
                                width: 25.w,
                              ),
                              SizedBox(
                                width: 11.w,
                              ),
                              subMenuTitleWidget(
                                  widget.menuTiles[i].name ?? '', context),
                            ],
                          )
                          // Text(
                          //   widget.menuTiles[i].name ?? '',
                          //   textAlign: TextAlign.left,
                          //   overflow: TextOverflow.ellipsis,
                          //   style: TextStyle(
                          //       fontSize: widget.menuTextSize,
                          //       fontWeight: FontWeight.w500,
                          //       color: widget.menuTextColor),
                          // ),
                          ),
                    ),
                  ),
                );
              }
              return Container();
            }),
      );
    }
    return listItems;
  }

  ///Add overlay using it's entry
  _addOverlay(OverlayEntry entry) {
    Overlay.of(context)?.insert(entry);
  }

  ///According to animation type returning different type of Tile with animation
  Widget _defineAnimationType(
      AnimationType animationType, double value, Widget? child, int i) {
    if (animationType == AnimationType.rightToLeft) {
      return RightToLeftAnimationTile(
        value: value,
        index: i,
        child: child!,
      );
    } else if (animationType == AnimationType.leftToRight) {
      return LeftToRightAnimationTile(
        value: value,
        index: i,
        child: child!,
      );
    } else if (animationType == AnimationType.topToBottom) {
      return TopToBottomAnimationTile(
        value: value,
        index: i,
        child: child!,
      );
    } else if (animationType == AnimationType.centerToTop) {
      return CenterTopAnimationTile(
        value: value,
        index: i,
        child: child!,
      );
    } else if (animationType == AnimationType.springAcrossAxis) {
      return SpringAcrossAxisAnimationTile(
        value: value,
        index: i,
        child: child!,
      );
    } else if (animationType == AnimationType.swingAcrossAxis) {
      return SwingAcrossAxisAnimationTile(
        value: value,
        index: i,
        child: child!,
      );
    } else {
      return LeftToRightAnimationTile(
        value: value,
        index: i,
        child: child!,
      );
    }
  }
}

///This is the Tile which performs animation
class RightToLeftAnimationTile extends StatelessWidget {
  final int index;
  final double value;
  final Widget child;

  const RightToLeftAnimationTile(
      {Key? key, required this.value, required this.child, required this.index})
      : super(key: key);

  ///Widget that performs animation from right to left
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: index == 0
          ? const EdgeInsets.only(top: 10)
          : const EdgeInsets.only(top: 0),
      child: Opacity(
        opacity: 1 - value,
        child: Transform(
          alignment: Alignment.centerLeft,
          transform: Matrix4.identity()
            ..translate(210, 0, 0)
            ..rotateY(value / 0.5)
            ..translate(-210, 0, 0),
          child: child,
        ),
      ),
    );
  }
}

///This is the Tile which performs animation
class LeftToRightAnimationTile extends StatelessWidget {
  final int index;
  final double value;
  final Widget child;

  const LeftToRightAnimationTile(
      {Key? key, required this.value, required this.child, required this.index})
      : super(key: key);

  ///Widget that performs animation from left to right
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: index == 0
          ? const EdgeInsets.only(top: 10)
          : const EdgeInsets.only(top: 0),
      child: Opacity(
        opacity: 1 - value,
        child: Transform(
          alignment: Alignment.centerLeft,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.01)
            ..rotateX(value < 0.2 ? value * pi / 6 : pi / 6)
            ..translate(-80, -30, 0)
            ..setRotationZ(pi / 2 * value)
            ..translate(80, 30, 0),
          child: child,
        ),
      ),
    );
  }
}

///This is the Tile which performs animation
class TopToBottomAnimationTile extends StatelessWidget {
  final int index;
  final double value;
  final Widget child;

  const TopToBottomAnimationTile(
      {Key? key, required this.value, required this.child, required this.index})
      : super(key: key);

  ///Widget that performs animation from bottom to top
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: index == 0
          ? const EdgeInsets.only(top: 10)
          : const EdgeInsets.only(top: 0),
      child: Opacity(
        opacity: 1 - value,
        child: Transform(
          alignment: Alignment.centerLeft,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.01)
            ..rotateY(value * 0.03),
          child: child,
        ),
      ),
    );
  }
}

///This is the Tile which performs animation
class CenterTopAnimationTile extends StatelessWidget {
  final int index;
  final double value;
  final Widget child;

  const CenterTopAnimationTile(
      {Key? key, required this.value, required this.child, required this.index})
      : super(key: key);

  ///Widget that performs animation from center to top
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: index == 0
          ? const EdgeInsets.only(top: 10)
          : const EdgeInsets.only(top: 0),
      child: Opacity(
        opacity: 1 - value,
        child: Transform(
          alignment: Alignment.centerLeft,
          transform: Matrix4.identity()
            ..translate(-30, 0, 0)
            ..rotateX(value / 0.5)
            ..translate(30, 0, 0),
          child: child,
        ),
      ),
    );
  }
}

///This is the Tile which performs animation
class SpringAcrossAxisAnimationTile extends StatelessWidget {
  final int index;
  final double value;
  final Widget child;

  const SpringAcrossAxisAnimationTile(
      {Key? key, required this.value, required this.child, required this.index})
      : super(key: key);

  ///Widget that performs animation spring between x and y
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: index == 0
          ? const EdgeInsets.only(top: 10)
          : const EdgeInsets.only(top: 0),
      child: Opacity(
        opacity: 1 - value,
        child: Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()
            ..translate(0, -10, -110)
            ..rotateY(value / 0.2)
            ..translate(0, 10, 110),
          child: child,
        ),
      ),
    );
  }
}

///This is the Tile which performs animation
class SwingAcrossAxisAnimationTile extends StatelessWidget {
  final int index;
  final double value;
  final Widget child;

  const SwingAcrossAxisAnimationTile(
      {Key? key, required this.value, required this.child, required this.index})
      : super(key: key);

  ///Widget that performs animation swing between x and y
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: index == 0
          ? const EdgeInsets.only(top: 10)
          : const EdgeInsets.only(top: 0),
      child: Opacity(
        opacity: 1 - value,
        child: Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()
            ..translate(0, -10, 0)
            ..rotateZ(value / 0.05)
            ..translate(0, 10, 110),
          child: child,
        ),
      ),
    );
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
