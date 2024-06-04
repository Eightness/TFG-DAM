import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:intl/intl.dart';

import '../../utils/constants.dart';
import '../widgets/team_showcase_mini.dart';
import '../widgets/windows_buttons.dart';
import '../../data/models/trainer.dart';

class Profile extends StatelessWidget {
  final Trainer trainer;
  final bool isCurrentTrainer;

  Profile({Key? key, required this.trainer, required this.isCurrentTrainer})
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
            length: 1,
            child: Scaffold(
              appBar: AppBar(
                title: Image.asset(
                  'assets/images/app_logo.png',
                  height: 125.0,
                  width: 300.0,
                ),
                centerTitle: true,
                backgroundColor: Constants.red,
                toolbarHeight: 150.0,
                shadowColor: Constants.black,
                bottom: const TabBar(
                  labelColor: Constants.white,
                  tabs: [
                    Tab(
                      height: 75,
                      text: ' P R O F I L E ',
                      icon: Icon(Icons.person),
                    ),
                  ],
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Constants.blue, Constants.darkBlue],
                  ),
                ),
                child: Center(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50.0, horizontal: 50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 800),
                                    child: Container(
                                      padding: const EdgeInsets.all(25.0),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Constants.white,
                                            Constants.grey
                                          ],
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(25.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            trainer.username,
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Member since ${DateFormat('yyyy-MM-dd').format(trainer.creationDate)}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Constants.darkBrown,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Stack(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 70,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/profile_picture.png'),
                                                  ),
                                                  SizedBox(width: 20),
                                                  Expanded(
                                                    child: Text(
                                                      trainer.bio,
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (isCurrentTrainer)
                                                Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: IconButton(
                                                    icon: Icon(Icons.edit,
                                                        color: Constants.blue),
                                                    onPressed: () {
                                                      // Acción de editar biografía
                                                    },
                                                  ),
                                                ),
                                            ],
                                          ),
                                          SizedBox(height: 40),
                                          Text(
                                            'Teams',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: 6, // Número de equipos
                                              itemBuilder: (context, index) {
                                                return TeamShowcaseMini(index: index, isCurrentTrainer: this.isCurrentTrainer,);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
