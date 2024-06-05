import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
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

class Home extends StatefulWidget {
  final Widget team;
  final Widget community;
  final Trainer currentTrainer;

  Home({
    Key? key,
    required this.team,
    required this.community,
    required this.currentTrainer,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool isDarkTheme;

  @override
  void initState() {
    super.initState();
    isDarkTheme = widget.currentTrainer.theme;
  }

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
                    itemBuilder: (context) => MenuItems.homeList.map((item) {
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
                  Text(
                    '${widget.currentTrainer.username}',
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
                bottom: TabBar(
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
                    widget.team,
                    widget.community,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onMenuItemSelected(BuildContext context, MenuItem item) {
    if (item.text == 'Profile') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(
            currentTrainer: widget.currentTrainer,
            isCurrentTrainer: true,
          ),
        ),
      );
    } else if (item.text == 'Settings') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Settings(currentTrainer: widget.currentTrainer)));
    } else if (item.text == 'Log out') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Welcome(signIn: SignIn(), register: Register())),
      );
    }
  }
}
