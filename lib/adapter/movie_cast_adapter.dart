import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_api/backend/backend.dart';
import 'package:learn_api/ui/movie_cast_card.dart';
import 'package:provider/provider.dart';


class MovieCastAdapter extends StatelessWidget {
  final Movies movies;

  const MovieCastAdapter({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<Backend>().getCast(movies.id),
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
            final c = snapshot.data;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: c.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieCastCard(
                    name: c[index].name,
                    role: c[index].character,
                    profilePic: 'https://image.tmdb.org/t/p/w500' + '${c[index].profile_path}',
                  );
                });

          }
        });
  }
}
