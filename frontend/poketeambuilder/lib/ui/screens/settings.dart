import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import '../../utils/constants.dart';
import '../widgets/windows_buttons.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController surnamesController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
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
              child: Text(
                'Cancel',
                style: TextStyle(color: Constants.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Delete',
                style: TextStyle(color: Constants.red),
              ),
              onPressed: () {
                // Acción para eliminar la cuenta
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
                backgroundColor: Constants.red,
                toolbarHeight: 150.0,
                shadowColor: Constants.black,
                bottom: const TabBar(
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
                    constraints: BoxConstraints(maxWidth: 800),
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
                          _buildThemeSwitch(),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Acción para guardar los cambios
                                },
                                child: Text('Save Changes'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Constants.blue,
                                  foregroundColor: Constants.white
                                ),
                              ),
                              ElevatedButton(
                                onPressed: _showDeleteAccountDialog,
                                child: Text('Delete Account'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Constants.red,
                                  foregroundColor: Constants.white
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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

  Widget _buildThemeSwitch() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Theme',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Constants.darkBrown,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Switch(
              value: isDarkMode,
              onChanged: _toggleTheme,
            ),
          ),
        ],
      ),
    );
  }
}
