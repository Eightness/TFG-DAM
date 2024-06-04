import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/trainer.dart';

class TrainerService {
  final String baseUrl = 'http://localhost:8080';

  // POST Trainer
  Future<bool> registerTrainer(Trainer trainer) async {
    final url = Uri.parse('$baseUrl/trainer/add');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(trainer.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Trainer successfully registered');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return true;
      } else {
        print('Failed to register trainer');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error registering trainer: $e');
      return false;
    }
  }

  // Check if a trainer exists with the specified username
  Future<bool> checkUsernameExists(String username) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/trainer/check-exists-username?username=$username'),
      );

      print(username);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final exists = jsonDecode(response.body);
        print('Username ${exists ? 'does exist' : 'does not exist'}');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return exists;
    } else {
    print('Failed to check username existence');
    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    return false;
    }
    } catch (e) {
    print('Error checking username existence: $e');
    return false;
    }
  }

  // Check if a trainer exists with the specified email
  Future<bool> checkEmailExists(String email) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/trainer/check-exists-email?email=$email'),
      );

      print(email);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final exists = jsonDecode(response.body);
        print('Email ${exists ? 'does exist' : 'does not exist'}');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return exists;
      } else {
        print('Failed to check email existence');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error checking email existence: $e');
      return false;
    }
  }

}
