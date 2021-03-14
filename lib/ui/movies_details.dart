import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learn_api/adapter/movie_video_adapter.dart';
import 'file:///D:/Android/Flutter/learn_api/lib/adapter/movie_review_adapter.dart';
import 'package:learn_api/backend/backend.dart';
import 'file:///D:/Android/Flutter/learn_api/lib/adapter/movie_cast_adapter.dart';


class MoviesDetails extends StatelessWidget {
  final Movies movies;

  const MoviesDetails({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movies.title),
        ),
        backgroundColor: Color(0xFF221B32),
        body: new ListView(
          children: [
            new Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      Hero(
                        tag: 'hero-${movies.id}-image',
                        child: new Container(
                          height: 210,
                          width: 140,
                          child: Image.network(
                              movies.imageUrl + movies.poster_path),
                        ),
                      ),
                      new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: Hero(
                                    tag: 'hero-${movies.id}-name',
                                    child: new Container(
                                      margin: const EdgeInsets.only(
                                          top: 10.0, bottom: 10.0, left: 14.0),
                                      child: Text(
                                        movies.title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: new TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            new Row(
                              children: <Widget>[
                                Hero(
                                  tag: 'hero-${movies.id}-star',

                                  child: new Container(
                                    margin: const EdgeInsets.only(left: 12.0),
                                    child: new Icon(Icons.star,
                                        color: Colors.yellow),
                                  ),
                                ),
                                Hero(
                                  tag: 'hero-${movies.id}-vote',

                                  child: new Container(
                                    margin: const EdgeInsets.only(right: 10.0),
                                    child: new Text(
                                      movies.vote_average.toString(),
                                      style: new TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            new Container(
                                margin:
                                    const EdgeInsets.only(top: 20, left: 30.0),
                                child: new Text(movies.release_date)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            viewline(),
            //Casts
            new Container(
              height: 120,
              child: MovieCastAdapter(movies: movies),
            ),
            viewline(),
            new MovieVideoAdapter(movies: movies),
            viewline(),
            new ListTile(
              title: Text(
                'OverView',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                margin: EdgeInsets.only(left: 12, top: 4),
                child: new Text(
                  movies.overview,
                  style: new TextStyle(
                      fontSize: 14.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
            ),
            viewline(),

            new MovieReviewAdapter(
              movies: movies,
            ),
          ],
        ));
  }
}

class viewline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(bottom: 12, top: 8),
      padding:
          const EdgeInsets.only(top: 8, left: 20.0, right: 10, bottom: 8.0),
      color: Color(0xFF382455),
    );
  }
}
