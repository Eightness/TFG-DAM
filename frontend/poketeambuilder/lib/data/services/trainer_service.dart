import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/trainer.dart';

class TrainerService {
  final String baseUrl = 'http://localhost:9090/trainer';

  // Add new trainer
  Future<bool> registerTrainer(Trainer trainer) async {
    final url = Uri.parse('$baseUrl/add');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(trainer.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
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
        Uri.parse('$baseUrl/check-exists-username?username=$username'),
      );

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
        Uri.parse('$baseUrl/check-exists-email?email=$email'),
      );

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

  // Check trainer credentials
  Future<bool> checkCredentials(String username, String password) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/check-credentials?username=$username&password=$password'),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final exists = jsonDecode(response.body);
        print('Credentials ${exists ? 'verified' : 'not verified'}');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return exists;
      } else {
        print('Failed to check credentials');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error checking credentials: $e');
      return false;
    }
  }

  // Get trainer by username
  Future<Trainer?> getTrainerByUsername(String username) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/get?username=$username'),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);

        final trainer = Trainer.fromJson(response.body);

        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return trainer;
      } else {
        print(
            'Failed to retrieve trainer with username $username'); // More specific message
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error fetching trainer with username $username: $e');
      return null;
    }
  }

  // Update current trainer
  Future<Trainer?> updateCurrentTrainer(Trainer trainer) async {
    final url = Uri.parse('$baseUrl/update-current');

    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(trainer.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Trainer successfully updated');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return Trainer.fromJson(response.body);
      } else {
        print('Failed to update trainer');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error updating trainer: $e');
      return null;
    }
  }

  // Delete current trainer
  Future<void> deleteCurrentTrainer(Trainer currentTrainer) async {
    final url = Uri.parse('$baseUrl/delete-current');

    try {
      final response = await http.delete(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(currentTrainer.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Trainer successfully deleted');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      } else {
        print('Failed to delete trainer');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error deleting trainer: $e');
    }
  }
}
