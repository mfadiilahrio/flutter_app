import 'package:core/movie/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailPage({Key key, this.movie}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState(movie);
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final Movie movie;

  _MovieDetailPageState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(movie.title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Column(
        children: <Widget>[
          Image.network(
            movie.poster.toString(),
            width: double.infinity,
            height: 300.0,
            fit: BoxFit.fitWidth,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Title : ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  movie.title,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Year : ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  movie.year,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
