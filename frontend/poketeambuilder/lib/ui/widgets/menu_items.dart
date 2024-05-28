import 'package:flutter/material.dart';
import 'package:poketeambuilder/ui/widgets/menu_item.dart';

class MenuItems {
  static const List<MenuItem> itemsList = [
    itemProfile,
    itemSettings,
    itemLogOut,
  ];

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