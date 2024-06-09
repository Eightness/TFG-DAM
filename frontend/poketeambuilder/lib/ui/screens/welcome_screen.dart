import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../widgets/windows_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  final Widget signIn;
  final Widget register;

  WelcomeScreen({Key? key, required this.signIn, required this.register})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
              backgroundColor: Constants.red,
              toolbarHeight: 150.0,
              shadowColor: Constants.black,
              bottom: TabBar(
                labelColor: Constants.white,
                tabs: [
                  Tab(
                    height: 75,
                    text: ' S I G N  I N ',
                    icon: Icon(Icons.person),
                  ),
                  Tab(
                    height: 75,
                    text: ' R E G I S T E R ',
                    icon: Icon(Icons.person_add),
                  ),
                ],
              ),
            ),
            body: Center(
              child: TabBarView(
                children: [
                  signIn,
                  register,
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
