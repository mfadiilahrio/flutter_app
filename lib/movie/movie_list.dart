import 'package:core/list_view_model.dart';
import 'package:core/movie/model/movie.dart';
import 'package:flutter/material.dart';

import 'movie_cell.dart';

class MovieList extends StatefulWidget {
  final ListViewModel<String, List<Movie>> viewModel;
  final String keyword;

  const MovieList({Key key, this.viewModel, this.keyword}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();

}

class _MovieListState extends State<MovieList> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  void dispose() {
    widget.viewModel.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

//    widget.viewModel.inputs.start("avenger");

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: StreamBuilder(
          stream: widget.viewModel.outputs.result,
          builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.data == null) return Container();

            final list = snapshot.data;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.7),
              itemCount: list.length,
              itemBuilder: (context, index) {
                if (index == list.length - 2) {
                  widget.viewModel.inputs.loadMore(widget.keyword);
                }

                return MovieCell(movie: list[index]);
              },
            );
          }),
    );
  }

  Future<Null> _refresh() async {
    widget.viewModel.inputs.start(widget.keyword);

    return null;
  }

}