import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class Backend {
  final String hostUrl;

  const Backend(this.hostUrl);

  Future<List<Video>> getVideo(int moviesId) async {
    final url =
        '$hostUrl/$moviesId/videos?api_key=afdcd475833e8e0d4d610c1bbaa5bfbd&lanuage=en-US';

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw HttpException(
        '${response.statusCode}: ${response.reasonPhrase}',
        uri: Uri.tryParse(url),
      );
    }

    final body = response.body;
    final jsonData = json.decode(body)['results'] as List;
    final reviews =
        jsonData.map((jsonObject) => Video.fromJson(jsonObject)).toList();

    return reviews;
  }

  Future<List<Reviews>> getRev(int moviesId) async {
    final url =
        '$hostUrl/$moviesId/reviews?api_key=afdcd475833e8e0d4d610c1bbaa5bfbd&lanuage=en-US';

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw HttpException(
        '${response.statusCode}: ${response.reasonPhrase}',
        uri: Uri.tryParse(url),
      );
    }

    final body = response.body;
    final jsonData = json.decode(body)['results'] as List;
    final reviews =
        jsonData.map((jsonObject) => Reviews.fromJson(jsonObject)).toList();

    return reviews;
  }

  Future<List<Casts>> getCast(int moviesId) async {
    final url =
        '$hostUrl/$moviesId/credits?api_key=afdcd475833e8e0d4d610c1bbaa5bfbd&lanuage=en-US';

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw HttpException(
        '${response.statusCode}: ${response.reasonPhrase}',
        uri: Uri.tryParse(url),
      );
    }

    final body = response.body;
    final jsonData = json.decode(body)['cast'] as List;
    final casts =
        jsonData.map((jsonObject) => Casts.fromJson(jsonObject)).toList();

    return casts;
  }

  Future<List<Movies>> getMovies(String movies) async {
    final url =
        '$hostUrl/$movies?api_key=afdcd475833e8e0d4d610c1bbaa5bfbd&language=en-US&page=1';

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw HttpException(
        '${response.statusCode}: ${response.reasonPhrase}',
        uri: Uri.tryParse(url),
      );
    }

    final body = response.body;
    final jsonData = json.decode(body)['results'] as List;
    final movie =
        jsonData.map((jsonObject) => Movies.fromJson(jsonObject)).toList();

    return movie;
  }
}

class Movies {
  const Movies({
    this.results,
    this.release_date,
    this.title,
    this.poster_path,
    this.vote_average,
    this.overview,
    this.id,
  });

  final String imageUrl = 'https://image.tmdb.org/t/p/w500';
  final String release_date;
  final String title;
  final String poster_path;
  final String overview;
  final double vote_average;
  final int id;
  final List<dynamic> results;

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      results: json['results'],
      release_date: json['release_date'],
      title: json['title'],
      poster_path: json['poster_path'],
      overview: json['overview'],
      vote_average: (json['vote_average'] as num).toDouble(),
      id: (json['id'] as num).toInt(),
    );
  }
}

class Casts {
  const Casts({
    this.name,
    this.character,
    this.profile_path,
  });

  final String imageUrl = 'https://image.tmdb.org/t/p/w500';

  final String name;
  final String character;
  final String profile_path;

  factory Casts.fromJson(Map<String, dynamic> json) {
    return Casts(
      name: json['name'],
      character: json['character'],
      profile_path: json['profile_path'],
    );
  }
}

class Reviews {
  const Reviews({
    this.author,
    this.content,
  });

  final String author;
  final String content;

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      author: json['author'],
      content: json['content'],
    );
  }
}

class Video {
  const Video({
    this.key,
    this.name,
  });

  final String key;
  final String name;

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(key: json['key'], name: json['name']);
  }
}

// String one  = 'popular' ;
// String two   = 'now_playing' ;
// String three  = 'top_rated' ;
// String four  = 'upcoming' ;