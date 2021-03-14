import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_api/backend/backend.dart';
import 'package:learn_api/ui/movies_details.dart';
import 'package:provider/provider.dart';

import '../anim.dart';
import 'movie_list_container.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedItem = 'popular';
  List _options = ['popular', 'now_playing', 'top_rated', 'upcoming'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Movies')),
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return _options
                    .map((movies) => PopupMenuItem(
                          child: Text(movies),
                          value: movies,
                        ))
                    .toList();
              },
              onSelected: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder(
            future: context.read<Backend>().getMovies("$_selectedItem"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('An error occurred.'),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final movies = snapshot.data;
                return ListView(
                  children: [
                    for (final movies in movies) ...[
                      WidgetANimator(
                        MoviesListContainer(
                          movies: movies,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MoviesDetails(movies: movies)));
                          },
                        ),
                      ),
                    ]
                  ],
                );
              }
            },
          ),
        ));
  }
}