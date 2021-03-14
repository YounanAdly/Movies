import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCastCard extends StatelessWidget {
  final String name;
  final String role;
  final String profilePic;

  MovieCastCard({Key key, this.name, this.role = '', this.profilePic = ''}) :
        assert(name != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: 6.0, right: 6.0),
      child: new Column(
        children: <Widget>[
          new Material(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
            clipBehavior: Clip.hardEdge,
            child: new CachedNetworkImage(
              placeholder: (context, url) => new Container(
                  width: 60,
                  height: 60,
                  child: new Center(
                    child:  new CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                    ),
                  )
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 60,
              height: 60,
              imageUrl: profilePic != '' ? profilePic : 'https://soe.ukzn.ac.za/wp-content/uploads/2018/04/profile-placeholder.png',
              fit: BoxFit.cover,
            ),
          ),
          new Container(
            padding: EdgeInsets.only(top: 10.0),
            width: 90.0,
            child: new Text(name, textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis, style:  new TextStyle(fontSize: 15.0,color: Colors.white)),
          ),
        ],
      ),
    );
  }
}