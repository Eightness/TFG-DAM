import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poketeambuilder/data/models/team.dart';

import '../models/comment.dart';

class CommentService {
  final String baseUrl = 'http://localhost:9090/comment';

  Future<Comment> addComment(Comment comment) async {
    final response = await http.post(
      Uri.parse(baseUrl + '/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(comment.toJson()),
    );

    if (response.statusCode == 200) {
      return Comment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add comment');
    }
  }

  Future<List<Comment>> getCommentsByTeam(Team team) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl/get-by-team?teamName=${team.name}&trainerUsername=${team.trainer.username}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List<Comment> commentList =
          (jsonDecode(response.body) as List<dynamic>).map((commentJson) {
        return Comment.fromJson(jsonEncode(commentJson));
      }).toList();

      return commentList;
    } else {
      throw Exception('Failed to fetch comments by team');
    }
  }

  Future<void> deleteComment(Comment comment) async {
    final response = await http.delete(
      Uri.parse(baseUrl + '/delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(comment.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete comment');
    }
  }
}
