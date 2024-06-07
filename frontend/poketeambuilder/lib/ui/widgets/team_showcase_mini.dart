import 'package:flutter/material.dart';
import 'package:poketeambuilder/data/models/trainer.dart';
import 'package:poketeambuilder/data/services/team_service.dart';
import 'package:poketeambuilder/utils/constants.dart';
import 'package:poketeambuilder/data/models/comment.dart';

import '../../data/models/team.dart';
import 'comment_showcase.dart';

class TeamShowcaseMini extends StatefulWidget {
  final bool isCurrentTrainer;
  final Team currentTeam;
  final Function() onTeamDeleted;

  const TeamShowcaseMini({
    Key? key,
    this.isCurrentTrainer = false,
    required this.currentTeam, required this.onTeamDeleted
  }) : super(key: key);

  @override
  _TeamShowcaseMiniState createState() => _TeamShowcaseMiniState();
}

class _TeamShowcaseMiniState extends State<TeamShowcaseMini> with AutomaticKeepAliveClientMixin {
  final TeamService _teamService = new TeamService();

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
                    widget.currentTeam.pokemon[index].spriteUrl != '' ? widget.currentTeam.pokemon[index].spriteUrl : 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/f720bb6e-b303-4877-bffb-d61df0ab183f/d3b98cf-4fc5c76b-2a99-47fc-98b6-d7d4ee8d9d9f.png',
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
                      onPressed: () {

                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Constants.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirm Delete'),
                              content: Text('Are you sure you want to delete this team?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel', style: TextStyle(color: Constants.red),),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                    await _teamService.deleteTeam(widget.currentTeam.name, widget.currentTeam.trainer.username);
                                    widget.onTeamDeleted();
                                  },
                                  child: Text('Delete', style: TextStyle(color: Constants.red),),
                                ),
                              ],
                            );
                          },
                        );
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
