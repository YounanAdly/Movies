import 'package:flutter/material.dart';
import 'package:learn_api/backend/backend.dart';

import 'movie_cast_card.dart';

class MoviesTest extends StatelessWidget {
  final Casts cast;
  final VoidCallback onTap;

  const MoviesTest({Key key, this.cast, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('TEST + ' + cast.name);
    return MovieCastCard(
       name: cast.name,
       role: cast.character,
       profilePic: 'https://image.tmdb.org/t/p/w500' + '${cast.profile_path}',
     );
  }
}
