import 'package:flutter/material.dart';
import 'package:poketeambuilder/ui/screens/tabs/community.dart';
import 'package:poketeambuilder/ui/screens/tabs/team_builder.dart';
import '../../../data/models/trainer.dart';
import '../../../data/services/trainer_service.dart';
import '../../../utils/constants.dart';
import '../home.dart';

class SignIn extends StatelessWidget {
  final TrainerService _trainerService = TrainerService();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final Trainer currentTrainer;

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
              _buildTextField('Username', controller: usernameController),
              SizedBox(height: 10),
              _buildTextField('Password', isPassword: true, controller: passwordController),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  await _signInTrainer(context);
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

  Future<void> _signInTrainer(BuildContext context) async {
    bool isValid = await _checkCredentials(context);
    if (isValid) {
      currentTrainer = (await _trainerService.getTrainerByUsername(usernameController.text))!;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home(teamContent: TeamBuilder(), communityContent: Community(), currentTrainer: currentTrainer,)),
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

  Future<bool> _checkCredentials(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;

    return _trainerService.checkCredentials(username, password);
  }
}
