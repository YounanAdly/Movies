import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_api/backend/backend.dart';
import 'package:provider/provider.dart';

class MovieReviewAdapter extends StatelessWidget {
  final Movies movies;

  const MovieReviewAdapter({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<Backend>().getRev(movies.id),
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
            final riv = snapshot.data;
            return ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: riv.length,
                itemBuilder: (BuildContext context, int index) {

                  return ListTile(
                    title: Text(
                      riv[index].author.toString(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.amber),
                    ),
                    subtitle: Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: Text(
                        riv[index].content.toString(),
                        style: TextStyle(color: Colors.white,),
                      ),
                    ),
                  );
                });
          }
        });
  }
}
