import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poketeambuilder/utils/constants.dart';
import 'package:poketeambuilder/data/models/comment.dart';

class CommentDisplay extends StatelessWidget {
  final Comment comment;

  CommentDisplay({required this.comment});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    return Container(
      width: 300,
      height: 100,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Constants.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.trainer.username,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            comment.body,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            dateFormat.format(comment.createdDate),
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
