import 'package:core/contants.dart';
import 'package:core/movie/get_movie_list_view_model.dart';
import 'package:core/movie/movie_cloud_service.dart';
import 'package:core/movie/movie_mapper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'movie_list.dart';

class MoviePage extends StatelessWidget {
  final client = Client();
  final String keyword;

  MoviePage({Key key, this.keyword}) : super(key: key);

  get movieListViewModel {
    final mapper = MovieMapper();
    final service = MovieCloudService(
        client: client,
        key: KEY,
        host: HOST,
        mapper: mapper);

    return GetMovieListViewModel<String>(service: service);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(keyword),
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context, false),
            )
        ),
        body: MovieList(viewModel: movieListViewModel, keyword: keyword),
      ),
    );
  }
}