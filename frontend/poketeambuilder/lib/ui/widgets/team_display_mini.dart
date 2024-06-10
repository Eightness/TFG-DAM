import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poketeambuilder/data/services/comment_service.dart';
import 'package:poketeambuilder/data/services/team_service.dart';
import 'package:poketeambuilder/ui/screens/team_editor_screen.dart';
import 'package:poketeambuilder/utils/constants.dart';
import 'package:poketeambuilder/data/models/comment.dart';

import '../../data/models/team.dart';
import '../../data/models/trainer.dart';
import '../screens/team_display_screen.dart';
import 'comment_display.dart';

class TeamDisplayMini extends StatefulWidget {
  final Trainer currentTrainer;
  final bool isCurrentTrainer;
  final Team currentTeam;
  final Function() onActionPerformed;

  const TeamDisplayMini({
    Key? key,
    this.isCurrentTrainer = false,
    required this.currentTeam,
    required this.onActionPerformed, required this.currentTrainer,
  }) : super(key: key);

  @override
  _TeamDisplayMiniState createState() => _TeamDisplayMiniState();
}

class _TeamDisplayMiniState extends State<TeamDisplayMini> with AutomaticKeepAliveClientMixin {
  final TeamService _teamService = TeamService();
  bool _isPressed = false;
  int _likeCount = 0;

  final CommentService _commentService = new CommentService();

  @override
  void initState() {
    super.initState();
    _likeCount = widget.currentTeam.numLikes;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeamDisplayScreen(currentTrainer: widget.currentTrainer, selectedTeam: widget.currentTeam,),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [widget.currentTeam.isPublic ? Constants.red.withOpacity(0.75) : Constants.blue.withOpacity(0.75), Constants.white],
              stops: [0.27, 0.0],
            ),
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: widget.currentTeam.isPublic ? Constants.red : Constants.blue,
              width: 4.0,
            ),
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
                top: 5,
                child: Text(
                  '${widget.currentTeam.name} - ${widget.currentTeam.trainer.username} ${widget.currentTeam.isPublic ? "" : "(Private)"}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Constants.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 50.0),
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
                  right: 10,
                  top: 0,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Constants.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeamEditorScreen(
                                currentTrainer: widget.currentTrainer,
                                selectedTeam: widget.currentTeam,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Constants.white),
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
                                      widget.onActionPerformed();
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
                child: widget.currentTeam.isPublic
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isPressed = !_isPressed;
                          if (_isPressed) {
                            _likeCount++;
                          } else {
                            _likeCount--;
                          }
                        });
                        if (_isPressed) {
                          await _teamService.likeTeam(widget.currentTeam);
                        } else {
                          await _teamService.dislikeTeam(widget.currentTeam);
                        }
                        widget.onActionPerformed();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Constants.white,
                        backgroundColor: _isPressed ? Constants.red : Constants.blue,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Constants.white),
                          SizedBox(width: 5),
                          Text(
                            '$_likeCount',
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
                )
                    : Container(), // Mostrar un contenedor vacío si el equipo no es público
              ),
              Positioned(
                right: 10,
                bottom: 0,
                child: Text(
                  'Created: ${DateFormat('yyyy-MM-dd').format(widget.currentTeam.createdDate)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Constants.darkBrown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCommentsDialog(BuildContext context) async {
    final TextEditingController commentController = TextEditingController();

    List<Comment> comments = await _commentService.getCommentsByTeam(widget.currentTeam);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Constants.grey,
              title: Text('Comments'),
              content: Container(
                width: 400,
                height: 500,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          return CommentDisplay(comment: comments[index]);
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
                  onPressed: () async {
                    final newComment = Comment(
                      createdDate: DateTime.now(),
                      trainer: widget.currentTrainer,
                      body: commentController.text,
                      team: widget.currentTeam,
                    );

                    // Call the service to add the comment to the backend
                    try {
                      await _commentService.addComment(newComment);
                      // Actualizar la lista de comentarios después de agregar uno nuevo
                      comments = await _commentService.getCommentsByTeam(widget.currentTeam);
                      setState(() {});
                    } catch (e) {
                      // Handle any errors
                      print('Error adding comment: $e');
                    }

                    // Clear the comment text field
                    commentController.clear();

                    // Close the dialog
                    Navigator.of(context).pop();
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
