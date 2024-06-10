import 'package:flutter/material.dart';
import 'package:poketeambuilder/data/services/team_service.dart';
import 'package:poketeambuilder/ui/screens/profile_screen.dart';
import 'package:poketeambuilder/utils/constants.dart';

import '../../../data/models/team.dart';
import '../../../data/models/trainer.dart';
import '../../../data/services/trainer_service.dart';
import '../../widgets/team_display_mini.dart';

class Community extends StatefulWidget {
  final Trainer currentTrainer;

  const Community({Key? key, required this.currentTrainer}) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

enum FilterType { mostVoted, commented, newest, oldest }

class _CommunityState extends State<Community> {
  TextEditingController searchController = TextEditingController();

  TeamService _teamService = TeamService();
  List<Team> _teams = [];
  List<Team> _filteredTeams = [];
  List<Team> _publicTeams = [];

  FilterType? _selectedFilter;

  @override
  void initState() {
    super.initState();
    _fetchAllTeams().then((_) {
      _selectedFilter = FilterType.newest;
      _applyFilter();
    });
  }

  Future<void> _fetchAllTeams() async {
    try {
      List<Team> teams = await _teamService.getAllPublicTeams();
      setState(() {
        _teams = teams;
        _publicTeams = List.from(teams);
        _applyFilter();
      });
    } catch (e) {
      print('Error fetching teams: $e');
    }
  }

  Future<void> _fetchTeamsWithComments() async {
    try {
      List<Team> teams = await _teamService.getTeamsWithComments();

      print('Teams fetched successfully: $teams');

      setState(() {
        _publicTeams = List.from(teams);
        _applyFilter();
      });
    } catch (e) {
      print('Error fetching teams with comments: $e');
    }
  }

  void _applyFilter() {
    setState(() {
      switch (_selectedFilter) {
        case FilterType.mostVoted:
          _filteredTeams = List.from(_teams)
            ..sort((a, b) => b.numLikes.compareTo(a.numLikes));
          break;
        case FilterType.commented:
          _filteredTeams = _publicTeams;
          break;
        case FilterType.newest:
          _filteredTeams = List.from(_teams)
            ..sort((a, b) => b.createdDate.compareTo(a.createdDate));
          break;
        case FilterType.oldest:
        default:
          _filteredTeams = List.from(_teams);
          break;
      }
    });
  }

  void _onFilterSelected(FilterType filter) {
    setState(() {
      _selectedFilter = filter;
      if (_selectedFilter == FilterType.commented) {
        _fetchTeamsWithComments();
      } else {
        _applyFilter();
      }
    });
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
                      _buildFilterButton('Most voted', FilterType.mostVoted),
                      SizedBox(height: 10.0),
                      _buildFilterButton('Commented', FilterType.commented),
                      SizedBox(height: 10.0),
                      _buildFilterButton('Newest', FilterType.newest),
                      SizedBox(height: 10.0),
                      _buildFilterButton('Oldest', FilterType.oldest),
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
                                        itemCount: _filteredTeams.length,
                                        itemBuilder: (context, index) {
                                          return TeamDisplayMini(
                                            key: UniqueKey(),
                                            isCurrentTrainer: false,
                                            currentTeam: _filteredTeams[index],
                                            onActionPerformed: () {},
                                            currentTrainer:
                                                widget.currentTrainer,
                                          );
                                        },
                                      )),
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
                                  builder: (context) => ProfileScreen(
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
                                  builder: (context) => ProfileScreen(
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
                                    'The trainer with username $username was not found.',
                                  ),
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

  Widget _buildFilterButton(String text, FilterType filter) {
    return ElevatedButton(
      onPressed: () {
        _onFilterSelected(filter);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Constants.white,
        backgroundColor:
            _selectedFilter == filter ? Constants.darkRed : Constants.red,
      ),
      child: Text(text),
    );
  }
}
