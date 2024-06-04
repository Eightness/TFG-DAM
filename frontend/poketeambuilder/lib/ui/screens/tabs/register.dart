import 'package:flutter/material.dart';
import 'package:poketeambuilder/data/models/trainer.dart';
import '../../../data/services/trainer_service.dart';
import '../../../utils/constants.dart';

class Register extends StatelessWidget {
  final TrainerService _trainerService = TrainerService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnamesController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          height: 705,
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
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
              Icon(Icons.person_add, size: 75, color: Constants.darkBrown),
              SizedBox(height: 20),
              Text(
                'Your data',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Constants.darkBrown,
                ),
              ),
              SizedBox(height: 20),
              _buildTextField('Name', controller: nameController),
              SizedBox(height: 10),
              _buildTextField('Surnames', controller: surnamesController),
              SizedBox(height: 10),
              _buildTextField('Email', controller: emailController),
              SizedBox(height: 10),
              _buildTextField('Phone', controller: phoneController),
              SizedBox(height: 10),
              _buildTextField('Username', controller: usernameController),
              SizedBox(height: 10),
              _buildTextField('Password',
                  isPassword: true, controller: passwordController),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  await _registerTrainer(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Constants.white,
                  backgroundColor: Constants.blue,
                  fixedSize: Size(200, 35),
                ),
                child:
                    Text('Register', style: TextStyle(color: Constants.white)),
              ),
            ],
          ),
        ),
      ),
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

  Future<void> _registerTrainer(BuildContext context) async {
    bool isValid = await _checkDataValidation(context);
    if (isValid) {
      String surnames = surnamesController.text;
      int spaceIndex = surnames.indexOf(' ');
      String firstSurname =
          spaceIndex != -1 ? surnames.substring(0, spaceIndex) : surnames;
      String secondSurname =
          spaceIndex != -1 ? surnames.substring(spaceIndex + 1) : '';

      Trainer newTrainer = Trainer(
        name: nameController.text,
        firstSurname: firstSurname,
        secondSurname: secondSurname,
        email: emailController.text,
        phone: phoneController.text,
        username: usernameController.text,
        password: passwordController.text,
        createdDate: DateTime.now(),
        theme: false,
        bio:
            'This is the bio of a trainer. It contains a brief description about the trainer.',
        teams: [],
      );

      bool registered = await _trainerService.registerTrainer(newTrainer);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(registered ? 'Success' : 'Error'),
            content: Text(registered
                ? 'Registered successfully!'
                : 'Error while registering.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK',
                    style: TextStyle(
                        color: registered ? Constants.blue : Constants.red)),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Username or email already exist.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK',
                      style: TextStyle(
                          color: Constants.red)),
                ),
              ],
            );
          }
            );
    }
  }

  Future<bool> _checkDataValidation(BuildContext context) async {
    String username = usernameController.text;
    String email = emailController.text;

    bool existsUsername = await _trainerService.checkUsernameExists(username);
    bool existsEmail = await _trainerService.checkEmailExists(email);

    print (existsUsername);
    print (existsEmail);

    if (existsUsername || existsEmail) {
      return false;
    } else {
      return true;
    }
  }
}