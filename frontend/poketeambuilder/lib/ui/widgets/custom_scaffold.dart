import 'package:flutter/material.dart';
import 'package:poketeambuilder/ui/widgets/menu_item.dart';
import 'package:poketeambuilder/ui/widgets/menu_items.dart';

import '../../utils/constants.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/app_logo.png', height: 300.0, width: 300.0),
        centerTitle: true,
        actions: [
          PopupMenuButton<MenuItem>(
            itemBuilder: (context) => [
              ...MenuItems.itemsList.map(buildItem).toList(),
            ],
            icon: const Icon(Icons.person, color: Colors.white, size: 40),
          ),
          const SizedBox(width: 10),
          const Text(
            'Username',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25
            ),
          ),
          const SizedBox(width: 100),
        ],
        backgroundColor: Constants.darkBlue,
        toolbarHeight: 150.0,
        shadowColor: Constants.black
      ),
      body: const Center(
        child: Text(
          'Body',
          style: TextStyle(fontSize: 24),
        )
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
    child: Row(
      children: [
        Icon(item.icon, color: Colors.black, size: 20),
        const SizedBox(width: 12),
        Text(item.text),
      ],
    )
  );
}

