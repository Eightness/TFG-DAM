import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poketeambuilder/utils/constants.dart';
import 'package:poketeambuilder/data/models/comment.dart';
import 'dart:math';
import 'package:poketeambuilder/data/models/trainer.dart';

import 'comment_showcase.dart';

class TeamShowcaseMini extends StatefulWidget {
  final int index;
  final bool isCurrentTrainer;
  final List<Comment> comments;

  const TeamShowcaseMini({
    Key? key,
    required this.index,
    this.isCurrentTrainer = false,
    required this.comments,
  }) : super(key: key);

  @override
  _TeamShowcaseMiniState createState() => _TeamShowcaseMiniState();
}

class _TeamShowcaseMiniState extends State<TeamShowcaseMini> {
  List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
    comments = widget.comments;
  }

  List<Comment> generateRandomComments(int count) {
    final random = Random();
    final List<String> commentsText = [
      "Great team! I love the synergy.",
      "Interesting choice of Pokémon. How does it fare against Dragon types?",
      "I think you should consider adding a water type.",
      "Solid team, but it might struggle against electric types.",
      "Impressive lineup! Have you tried it in competitive battles?",
      "Your team composition is really creative!",
      "Good balance between offense and defense.",
      "I would swap one of your Pokémon for a tankier one.",
      "This team looks fun to play with!",
      "You might need more speed on your team.",
      "Great strategy! I can see this team winning many battles.",
      "Consider adding a Pokémon with status moves.",
      "Your team has a solid core, well done!",
      "Looks strong! How does it perform against legendary Pokémon?",
      "Fantastic team! Your choice of abilities is spot on."
    ];

    return List.generate(count, (index) {
      final createdDate = DateTime.now().subtract(Duration(days: random.nextInt(100)));
      final trainer = Trainer(
          name: 'Albert',
          firstSurname: 'Lozano',
          secondSurname: 'Blasco',
          email: 'albertlb08@gmail.com',
          phone: '625760988',
          password: '12345',
          username: 'Eightness',
          createdDate: DateTime.now(),
          theme: true,
          bio:
          'This is the bio of a trainer. It contains a brief description about the trainer.',
          teams: []);
      final body = commentsText[random.nextInt(commentsText.length)];

      return Comment(
        trainer: trainer,
        body: body, createdDate: createdDate,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 10,
              child: Text(
                'Team${widget.index + 1} - Username',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                  Icon(Icons.catching_pokemon, size: 50, color: Constants.red),
                ],
              ),
            ),
            if (widget.isCurrentTrainer)
              Positioned(
                right: 0,
                top: 0,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Constants.blue),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Constants.red),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            Positioned(
              left: 10,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Constants.white,
                      backgroundColor: Constants.red,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Constants.white),
                        SizedBox(width: 5),
                        Text(
                          '25',
                          style: TextStyle(
                            fontSize: 14,
                            color: Constants.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _showCommentsDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Constants.white,
                      backgroundColor: Constants.blue,
                    ),
                    child: Text('Comments'),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              bottom: 0,
              child: Text(
                'Created: $formattedDate',
                style: TextStyle(
                  fontSize: 14,
                  color: Constants.darkBrown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCommentsDialog(BuildContext context) {
    final TextEditingController commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Constants.grey,
              title: Text('Comments'),
              content: Container(
                width: 600,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return CommentShowcase(comment: comments[index]);
                        },
                      ),
                    ),
                    TextField(
                      controller: commentController,
                      decoration: InputDecoration(
                        hintText: 'Write a comment...',
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Close',
                    style: TextStyle(color: Constants.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Constants.blue),
                  ),
                  onPressed: () {
                    final newComment = Comment(
                      createdDate: DateTime.now(),
                      trainer: Trainer(
                        name: 'New',
                        firstSurname: 'User',
                        secondSurname: 'User',
                        email: 'newuser@example.com',
                        phone: '0000000000',
                        password: 'password',
                        username: 'NewUser',
                        createdDate: DateTime.now(),
                        theme: true,
                        bio: 'This is a new user.',
                        teams: [],
                      ),
                      body: commentController.text,
                    );
                    setState(() {
                      comments.add(newComment);
                    });
                    commentController.clear();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
