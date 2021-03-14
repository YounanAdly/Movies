import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_api/backend/backend.dart';
import 'package:learn_api/ui/movies_details.dart';
import 'package:provider/provider.dart';

import '../anim.dart';
import 'movie_list_container.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Movies')),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Popular', 'Nowplaying'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: new Container(
                      child: Text(choice),
                    ));
                }).toList();
              },
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder(
            future: context.read<Backend>().getMovies('popular'),
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

void handleClick(String value) {
  print('TEST + = '  + value);
  switch (value) {
    case 'Popular': print('TEST 1');
      // print('TEST +== ' + one.replaceAll(one, 'now_playing'));
      break;
    case 'Nowplaying' : print('TEST 2');
      break;
  }
}
