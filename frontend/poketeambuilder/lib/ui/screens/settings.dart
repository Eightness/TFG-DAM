import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:poketeambuilder/ui/screens/home.dart';
import 'package:poketeambuilder/ui/screens/profile.dart';
import 'package:poketeambuilder/ui/screens/tabs/community.dart';
import 'package:poketeambuilder/ui/screens/tabs/register.dart';
import 'package:poketeambuilder/ui/screens/tabs/signin.dart';
import 'package:poketeambuilder/ui/screens/tabs/team_builder.dart';
import 'package:poketeambuilder/ui/screens/welcome.dart';

import '../../data/models/trainer.dart';
import '../../data/services/trainer_service.dart';
import '../../utils/constants.dart';
import '../widgets/menu_item.dart';
import '../widgets/menu_items.dart';
import '../widgets/windows_buttons.dart';

class Settings extends StatefulWidget {
  final Trainer currentTrainer;

  Settings({Key? key, required this.currentTrainer}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TrainerService _trainerService = TrainerService();

  late TextEditingController nameController;
  late TextEditingController surnamesController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    _initializeTheme();
    nameController = TextEditingController(text: widget.currentTrainer.name);
    surnamesController = TextEditingController(
        text: '${widget.currentTrainer.firstSurname} ${widget.currentTrainer.secondSurname}');
    emailController = TextEditingController(text: widget.currentTrainer.email);
    phoneController = TextEditingController(text: widget.currentTrainer.phone);
    usernameController = TextEditingController(text: widget.currentTrainer.username);
    passwordController = TextEditingController(text: widget.currentTrainer.password);
  }

  void _initializeTheme() {
    setState(() {
      Constants.updateTheme(widget.currentTrainer.theme);
    });
  }

  void _toggleTheme(bool value) async {
    setState(() {
      Constants.updateTheme(value);
    });

    widget.currentTrainer.theme = value;
    print(widget.currentTrainer.theme);
    await _trainerService.updateCurrentTrainer(widget.currentTrainer);
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Constants.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete', style: TextStyle(color: Constants.red)),
              onPressed: () async {
                await _trainerService.deleteCurrentTrainer(widget.currentTrainer);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome(signIn: SignIn(), register: Register())),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showSaveChangesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Changes Saved'),
          content: Text('Your changes have been saved successfully.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                    itemBuilder: (context) => MenuItems.settingsList.map((item) {
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
                      text: ' S E T T I N G S ',
                      icon: Icon(Icons.settings),
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
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 1000),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          padding: const EdgeInsets.symmetric(
                              vertical: 50.0, horizontal: 50.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Constants.white, Constants.grey],
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Theme',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.darkBrown,
                                ),
                              ),
                              Text(
                                'Light / Dark',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Constants.darkBrown,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Switch(
                                value: widget.currentTrainer.theme,
                                onChanged: (value) {
                                  _toggleTheme(value);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(25.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Constants.white, Constants.grey],
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 70,
                                  backgroundImage: AssetImage('assets/images/profile_picture.png'),
                                ),
                                SizedBox(height: 20),
                                _buildUserInfoField('Name', nameController),
                                _buildUserInfoField('Surnames', surnamesController),
                                _buildUserInfoField('Email', emailController, isEditable: false),
                                _buildUserInfoField('Phone', phoneController),
                                _buildUserInfoField('Username', usernameController, isEditable: false),
                                _buildUserInfoField('Password', passwordController, isPassword: true),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    _saveChanges();
                                    _showSaveChangesDialog();
                                  },
                                  child: Text('Save Changes'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Constants.blue,
                                    foregroundColor: Constants.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 200,
                          height: 200,
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Constants.white, Constants.grey],
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person_off, color: Constants.darkBrown, size: 50.0),
                              SizedBox(height: 20.0),
                              ElevatedButton(
                                onPressed: _showDeleteAccountDialog,
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Constants.white,
                                  backgroundColor: Constants.red,
                                ),
                                child: Text('Delete account'),
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
        ),
      ],
    );
  }

  Widget _buildUserInfoField(String label, TextEditingController controller, {bool isEditable = true, bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Constants.darkBrown,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TextField(
              controller: controller,
              enabled: isEditable,
              obscureText: isPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
        ],
      ),
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
    } else if (item.text == 'Home') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Home(team: TeamBuilder(), community: Community(), currentTrainer: widget.currentTrainer)),
      );
    }
  }

  void _saveChanges() async {
    String name = nameController.text;
    List<String> surnames = surnamesController.text.split(' ');
    String phone = phoneController.text;
    String password = passwordController.text;

    setState(() {
      widget.currentTrainer.name = name;
      widget.currentTrainer.firstSurname = surnames.isNotEmpty ? surnames[0] : '';
      widget.currentTrainer.secondSurname = surnames.length > 1 ? surnames[1] : '';
      widget.currentTrainer.phone = phone;
      widget.currentTrainer.password = password;
    });

    await _trainerService.updateCurrentTrainer(widget.currentTrainer);
  }

}
