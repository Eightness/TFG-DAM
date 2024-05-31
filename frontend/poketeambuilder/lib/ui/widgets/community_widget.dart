import 'package:flutter/material.dart';
import 'package:poketeambuilder/utils/constants.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  String selectedGeneration = 'Generation 1';
  bool isPublic = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 300.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column with filters
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200, // Ajusta el ancho del contenedor
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
                  crossAxisAlignment: CrossAxisAlignment.center, // Alinea los elementos verticalmente al centro
                  mainAxisAlignment: MainAxisAlignment.center, // Alinea los elementos horizontalmente al centro
                  children: [
                    Text(
                      'Filters',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
            ],
          ),
          SizedBox(width: 50.0),
          // Center Column with the same background as PokemonBuilder
          Expanded(
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
                  // You can add any other content here
                  Text(
                    'Community Content',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 50.0),
          // Right Column with profile search
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200, // Ajusta el ancho del contenedor
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
                  crossAxisAlignment: CrossAxisAlignment.center, // Alinea los elementos verticalmente al centro
                  mainAxisAlignment: MainAxisAlignment.center, // Alinea los elementos horizontalmente al centro
                  children: [
                    Icon(Icons.person),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: 'Search Profiles',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle search action
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
        ],
      ),
    );
  }
}
