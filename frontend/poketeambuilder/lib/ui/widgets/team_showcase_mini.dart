import 'package:flutter/material.dart';
import 'package:poketeambuilder/utils/constants.dart';
import 'package:poketeambuilder/data/models/comment.dart';

import '../../data/models/team.dart';
import 'comment_showcase.dart';

class TeamShowcaseMini extends StatefulWidget {
  final bool isCurrentTrainer;
  final Team currentTeam;

  const TeamShowcaseMini({
    Key? key,
    this.isCurrentTrainer = false,
    required this.currentTeam,
  }) : super(key: key);

  @override
  _TeamShowcaseMiniState createState() => _TeamShowcaseMiniState();
}

class _TeamShowcaseMiniState extends State<TeamShowcaseMini> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                '${widget.currentTeam.name} - ${widget.currentTeam.trainer.username}',
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
                children: List.generate(widget.currentTeam.pokemon.length, (index) {
                  return Image.network(
                    widget.currentTeam.pokemon[index].spriteUrl,
                    height: 90.0,
                    width: 90.0,
                  );
                }),
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
                      onPressed: () {

                      },
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
                          '${widget.currentTeam.numLikes}',
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
                'Created: ${widget.currentTeam.createdDate}',
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
                height: 1000,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.currentTeam.comments.length,
                        itemBuilder: (context, index) {
                          return CommentShowcase(comment: widget.currentTeam.comments[index]);
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
                    style: TextStyle(color: Constants.red),
                  ),
                  onPressed: () {
                    final newComment = Comment(
                      createdDate: DateTime.now(),
                      trainer: widget.currentTeam.trainer,
                      body: commentController.text,
                    );
                    setState(() {
                      widget.currentTeam.comments.add(newComment);
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

  @override
  bool get wantKeepAlive => true;

}
