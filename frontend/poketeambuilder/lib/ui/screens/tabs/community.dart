import 'package:flutter/material.dart';
import 'package:poketeambuilder/data/services/team_service.dart';
import 'package:poketeambuilder/ui/screens/profile.dart';
import 'package:poketeambuilder/utils/constants.dart';

import '../../../data/models/team.dart';
import '../../../data/models/trainer.dart';
import '../../../data/services/trainer_service.dart';
import '../../widgets/team_showcase_mini.dart';

class Community extends StatefulWidget {
  final Trainer currentTrainer;

  const Community({super.key, required this.currentTrainer});

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  TextEditingController searchController = TextEditingController();

  TeamService _teamService = new TeamService();
  List<Team> _teams = [];

  @override
  void initState() {
    super.initState();
    _fetchAllTeams();
  }

  Future<void> _fetchAllTeams() async  {
    try {
        List<Team> teams = await _teamService.getAllPublicTeams();
      setState(() {
        _teams = teams;
      });
    } catch (e) {
      print('Error fetching natures: $e');
    }
  }

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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 300,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Constants.white, Constants.grey],
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Filters',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Constants.darkBrown,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Constants.white,
                          backgroundColor: Constants.red,
                        ),
                        child: Text('Most voted'),
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Constants.white,
                          backgroundColor: Constants.red,
                        ),
                        child: Text('Commented'),
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Constants.white,
                          backgroundColor: Constants.red,
                        ),
                        child: Text('Generation'),
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Constants.white,
                          backgroundColor: Constants.red,
                        ),
                        child: Text('Newest'),
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Constants.white,
                          backgroundColor: Constants.red,
                        ),
                        child: Text('Oldest'),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Constants.white, Constants.grey],
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Pokémon Teams',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 600),
                                child: Container(
                                  padding: const EdgeInsets.all(25.0),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Constants.white, Constants.grey],
                                    ),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: _teams.length,
                                          itemBuilder: (context, index) {
                                            return TeamShowcaseMini(
                                              isCurrentTrainer: false,
                                              currentTeam: _teams[index],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 200,
                  height: 200,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Constants.white, Constants.grey],
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                          Icon(Icons.search),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          labelText: 'Search Profiles',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      ElevatedButton(
                        onPressed: () async {
                          String username = searchController.text;
                          Trainer? trainer = await TrainerService()
                              .getTrainerByUsername(username);
                          if (trainer != null) {
                            if (trainer.username.toLowerCase() ==
                                widget.currentTrainer.username.toLowerCase()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(
                                    currentTrainer: widget.currentTrainer,
                                    editable: true,
                                    trainerToSee: trainer,
                                  ),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(
                                    currentTrainer: widget.currentTrainer,
                                    editable: false,
                                    trainerToSee: trainer,
                                  ),
                                ),
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Trainer Not Found',
                                    style: TextStyle(color: Constants.red),
                                  ),
                                  content: Text(
                                      'The trainer with username $username was not found.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'OK',
                                        style: TextStyle(color: Constants.red),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Constants.white,
                          backgroundColor: Constants.red,
                        ),
                        child: Text('Search'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
