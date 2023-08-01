import 'package:flutter/material.dart';

class NavBarModel {
  String? title;
  int? id;
  bool? isSelcted;
  IconData? icon;
  IconData? dropDownIcon;
  List<NavBarMenu>? menuOptions = [];

  NavBarModel(
      {this.title,
      this.id,
      this.isSelcted,
      this.icon,
      this.dropDownIcon,
      this.menuOptions});
}

class NavBarMenu {
  String? menuTitle;
  int? id;
  bool? isSelected;
  IconData? icon;
  List<SubMenuData>? subMenu = [];

  NavBarMenu(
      {this.menuTitle, this.id, this.isSelected, this.icon, this.subMenu});
}

class SubMenuData {
  String? subMenuTitle;
  int? id;
  bool? isSelected;
  IconData? icon;

  SubMenuData({this.subMenuTitle, this.id, this.isSelected, this.icon});
}
