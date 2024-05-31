import 'package:flutter/material.dart';
import 'package:poketeambuilder/ui/widgets/menu_item.dart';
import 'package:poketeambuilder/ui/widgets/menu_items.dart';

import '../../utils/constants.dart';
import '../screens/profile.dart';
import '../screens/settings.dart';

class AppStructure extends StatelessWidget {
  final Widget teamContent;
  final Widget communityContent;

  AppStructure({Key? key, required this.teamContent, required this.communityContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/app_logo.png',
            height: 125.0,
            width: 300.0,
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton<MenuItem>(
              itemBuilder: (context) => MenuItems.itemsList.map((item) {
                return PopupMenuItem<MenuItem>(
                  value: item,
                  child: Row(
                    children: [
                      Icon(item.icon, color: Colors.black, size: 20),
                      const SizedBox(width: 12),
                      Text(item.text),
                    ],
                  ),
                );
              }).toList(),
              onSelected: (item) => onMenuItemSelected(context, item), // Handle menu item selection
              icon: const Icon(Icons.person, color: Colors.white, size: 40),
            ),
            const SizedBox(width: 5),
            const Text(
              'Username',
              style: TextStyle(
                color: Constants.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 50),
          ],
          backgroundColor: Constants.red,
          toolbarHeight: 150.0,
          shadowColor: Constants.black,
          bottom: const TabBar(
            labelColor: Constants.white,
            tabs: [
              Tab(
                height: 75,
                text: ' T E A M ',
                icon: Icon(Icons.catching_pokemon_outlined),
              ),
              Tab(
                height: 75,
                text: ' C O M M U N I T Y ',
                icon: Icon(Icons.person_pin_circle_sharp),
              ),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [
              teamContent,
              communityContent,
            ],
          ),
        ),
      ),
    );
  }

  void onMenuItemSelected(BuildContext context, MenuItem item) {
    if (item.text == 'Profile') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    } else if (item.text == 'Settings') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Settings()),
      );
    }
  }
}
