import 'package:flutter/material.dart';
import 'package:learn_api/backend/backend.dart';
import 'file:///D:/Android/Flutter/learn_api/lib/main.dart';

class MoviesListContainer extends StatelessWidget {
  final Movies movies;
  final VoidCallback onTap;

  const MoviesListContainer({Key key, this.movies, this.onTap})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onTap,
      child: new Card(
        elevation: 10,
        // color: Colors.black,
        margin: EdgeInsets.all(15),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'hero-${movies.id}-image',
              child: new Container(
                margin: const EdgeInsets.only(right: 15),
                width: 100.0,
                height: 150.0,
                child: new Image.network(movies.imageUrl + movies.poster_path),
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
                            margin:
                                const EdgeInsets.only(top: 12.0, bottom: 10.0),
                            child: new Text(
                              movies.title,
                              style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Hero(
                        tag: 'hero-${movies.id}-star',
                        child: new Container(
                          margin: const EdgeInsets.only(right: 5.0),
                          child: new Icon(Icons.star, color: Colors.yellow),
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
                    margin: const EdgeInsets.only(right: 10.0),
                    child: new Text(
                      movies.overview,
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          "RELEASED",
                          style: new TextStyle(
                            color: Colors.grey[500],
                            fontSize: 11.0,
                          ),
                        ),
                        new Container(
                            margin: const EdgeInsets.only(left: 5.0),
                            child: new Text(movies.release_date)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
