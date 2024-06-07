import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:intl/intl.dart';
import 'package:poketeambuilder/data/services/team_service.dart';
import 'package:poketeambuilder/data/services/trainer_service.dart';
import 'package:poketeambuilder/ui/screens/settings.dart';
import 'package:poketeambuilder/ui/screens/tabs/community.dart';
import 'package:poketeambuilder/ui/screens/tabs/register.dart';
import 'package:poketeambuilder/ui/screens/tabs/signin.dart';
import 'package:poketeambuilder/ui/screens/tabs/team_builder.dart';
import 'package:poketeambuilder/ui/screens/welcome.dart';

import '../../data/models/team.dart';
import '../../utils/constants.dart';
import '../widgets/menu_item.dart';
import '../widgets/menu_items.dart';
import '../widgets/team_showcase_mini.dart';
import '../widgets/windows_buttons.dart';
import '../../data/models/trainer.dart';
import 'home.dart';

class Profile extends StatefulWidget {
  Trainer currentTrainer;
  final Trainer trainerToSee;
  final bool editable;

  final TrainerService _trainerService = new TrainerService();
  final TeamService _teamService = new TeamService();

  Profile(
      {Key? key,
      required this.currentTrainer,
      required this.editable,
      required this.trainerToSee})
      : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  final TextEditingController bioController = TextEditingController();

  List<Team> _trainerTeams = [];

  @override
  void initState() {
    super.initState();
    loadTrainerTeams();
  }

  Future<void> loadTrainerTeams() async {
    try {
      List<Team>? trainerTeams;

      if (widget.editable == true) {
        trainerTeams = await widget._teamService.getTeamsByTrainerUsername(widget.trainerToSee.username);
      } else {
        trainerTeams = await widget._teamService.getPublicTeamsByTrainerUsername(widget.trainerToSee.username);
      }

      if (trainerTeams != null) {
        setState(() {
          _trainerTeams = trainerTeams!;
        });
      }
    } catch (e) {
      print("Error loading trainer data: $e");
    }
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
            length: 1,
            child: Scaffold(
              appBar: AppBar(
                title: Image.asset(
                  'assets/images/app_logo.png',
                  height: 125.0,
                  width: 300.0,
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
                actions: [
                  PopupMenuButton<MenuItem>(
                    itemBuilder: (context) => MenuItems.profileList.map((item) {
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
                    icon:
                        const Icon(Icons.person, color: Colors.white, size: 40),
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
                                            widget.trainerToSee.username,
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Member since ${DateFormat('yyyy-MM-dd').format(widget.trainerToSee.createdDate)}',
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
                                                      widget.trainerToSee.bio,
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (widget.editable)
                                                Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: IconButton(
                                                    icon: Icon(Icons.edit,
                                                        color: Constants.blue),
                                                    onPressed: () {
                                                      // Update bio logic
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Biography'),
                                                            content: _buildTextField(
                                                                'Update biography',
                                                                isPassword:
                                                                    false,
                                                                controller:
                                                                    bioController),
                                                            actions: [
                                                              TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  widget.currentTrainer
                                                                          .bio =
                                                                      bioController
                                                                          .text;
                                                                  await widget
                                                                      ._trainerService
                                                                      .updateCurrentTrainer(
                                                                          widget
                                                                              .currentTrainer);
                                                                  setState(
                                                                      () {}); // Update UI
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    'OK',
                                                                    style: TextStyle(
                                                                        color: Constants
                                                                            .red)),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
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
                                              itemCount: _trainerTeams.length,
                                              itemBuilder: (context, index) {
                                                return TeamShowcaseMini(
                                                  isCurrentTrainer: widget.editable,
                                                  currentTeam: _trainerTeams[index],
                                                  onActionPerformed: () {
                                                    loadTrainerTeams();
                                                  }
                                                );
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

  Widget _buildTextField(String labelText,
      {bool isPassword = false, TextEditingController? controller}) {
    return Container(
      width: 300,
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Constants.darkBrown),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.darkBrown),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Constants.red),
          ),
        ),
      ),
    );
  }

  void onMenuItemSelected(BuildContext context, MenuItem item) {
    if (item.text == 'Settings') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Settings(currentTrainer: widget.currentTrainer)));
    } else if (item.text == 'Log out') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Welcome(signIn: SignIn(), register: Register())),
      );
    } else if (item.text == 'Home') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home(
                team: TeamBuilder(currentTrainer: widget.currentTrainer,),
                community: Community(
                  currentTrainer: widget.currentTrainer,
                ),
                currentTrainer: widget.currentTrainer)),
      );
    }
  }
}
