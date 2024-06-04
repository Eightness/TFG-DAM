import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:poketeambuilder/data/models/trainer.dart';
import 'package:poketeambuilder/ui/screens/tabs/register.dart';
import 'package:poketeambuilder/ui/screens/tabs/signin.dart';
import 'package:poketeambuilder/ui/screens/welcome.dart';
import 'package:poketeambuilder/ui/widgets/menu_item.dart';
import 'package:poketeambuilder/ui/widgets/menu_items.dart';

import '../../utils/constants.dart';
import '../widgets/windows_buttons.dart';
import 'profile.dart';
import 'settings.dart';

class Home extends StatelessWidget {
  final Widget teamContent;
  final Widget communityContent;

  Home({Key? key, required this.teamContent, required this.communityContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Constants.red,
          child: WindowTitleBarBox(
            child: MoveWindow(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  WindowButtons(),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
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
                  onSelected: (item) => onMenuItemSelected(context, item),
                  // Handle menu item selection
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
        ))
      ],
    );
  }

  void onMenuItemSelected(BuildContext context, MenuItem item) {
    if (item.text == 'Profile') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(
            trainer: Trainer(
                name: 'Albert',
                firstSurname: 'Lozano',
                secondSurname: 'Blasco',
                email: 'albertlb08@gmail.com',
                phone: '625760988',
                password: '12345',
                username: 'Eightness',
                creationDate: DateTime.now(),
                theme: true,
                bio:
                    'This is the bio of a trainer. It contains a brief description about the trainer.'),
            isCurrentTrainer: true,
          ),
        ),
      );
    } else if (item.text == 'Settings') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Settings(
                  trainer: Trainer(
                      name: 'Albert',
                      firstSurname: 'Lozano',
                      secondSurname: 'Blasco',
                      email: 'albertlb08@gmail.com',
                      phone: '625760988',
                      password: '12345',
                      username: 'Eightness',
                      creationDate: DateTime.now(),
                      theme: true,
                      bio:
                          'This is the bio of a trainer. It contains a brief description about the trainer.'),
                )),
      );
    } else if (item.text == 'Log out') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Welcome(signIn: SignIn(), register: Register())),
      );
    }
  }
}
