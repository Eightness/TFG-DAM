import 'package:flutter/material.dart';
import 'package:poketeambuilder/ui/screens/tabs/community.dart';
import 'package:poketeambuilder/ui/screens/tabs/team_builder.dart';
import '../../../utils/constants.dart';
import '../home.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Constants.blue, Constants.darkBlue],
        ),
      ),
      child: Center(
        child: Container(
          width: 400,
          height: 500,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 100, color: Constants.darkBrown),
              SizedBox(height: 20),
              Text(
                'Your credentials',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Constants.darkBrown,
                ),
              ),
              SizedBox(height: 20),
              _buildTextField('Username'),
              SizedBox(height: 10),
              _buildTextField('Password', isPassword: true),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  bool isValid = checkCredentials(context);
                  if (isValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home(teamContent: TeamBuilder(), communityContent: Community(),)),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Invalid username or password.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK', style: TextStyle(color: Constants.red)),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Constants.white, backgroundColor: Constants.red, fixedSize: Size(200, 35)
                ),
                child: Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, {bool isPassword = false}) {
    return Container(
      width: 300,
      child: TextField(
        obscureText: isPassword,
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

  bool checkCredentials(BuildContext context) {
    return false;
  }
}
