import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_api/backend/backend.dart';
import 'package:provider/provider.dart';

import 'movie_youtube_adapter.dart';

class MovieVideoAdapter extends StatelessWidget {
  final Movies movies;

  const MovieVideoAdapter({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<Backend>().getVideo(movies.id),
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
            final video = snapshot.data;
            print('TEST Video =' + video[0].key.toString());
            return Youtube(videoLink: video[0].key.toString());
          }
        });
  }
}
