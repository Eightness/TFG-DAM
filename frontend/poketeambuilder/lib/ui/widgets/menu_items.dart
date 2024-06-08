import 'package:flutter/material.dart';
import 'package:poketeambuilder/ui/widgets/menu_item.dart';

class MenuItems {
  static const List<MenuItem> homeList = [
    itemProfile,
    itemSettings,
    itemLogOut,
  ];

  static const List<MenuItem> settingsList = [
    itemHome,
    itemProfile,
    itemLogOut,
  ];

  static const List<MenuItem> profileList = [
    itemHome,
    itemSettings,
    itemLogOut,
  ];

  static const List<MenuItem> teamList = [
    itemHome,
    itemProfile,
    itemSettings,
    itemLogOut,
  ];

  static const itemHome = MenuItem(
    text: 'Home',
    icon: Icons.home,
  );

  static const itemProfile = MenuItem(
    text: 'Profile',
    icon: Icons.person,
  );

  static const itemSettings = MenuItem(
    text: 'Settings',
    icon: Icons.settings,
  );

  static const itemLogOut = MenuItem(
    text: 'Log out',
    icon: Icons.logout,
  );
}
