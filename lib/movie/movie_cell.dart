import 'package:core/movie/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/movie/movie_detail.dart';

class MovieCell extends StatelessWidget {
  final Movie movie;

  const MovieCell({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Image.network(
                  movie.poster.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(movie.title, textAlign: TextAlign.center,),
              )
            ],
          )
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailPage(movie: movie)));
      },
    );
  }

}