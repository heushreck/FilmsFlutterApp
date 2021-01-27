import 'package:FilmsFlutterApp/di/get_it.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_detail_entity.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_params_with_title.dart';
import 'package:FilmsFlutterApp/domain/usecases/get_tomato_scores.dart';
import 'package:flutter/material.dart';
import 'package:FilmsFlutterApp/common/extensions/num_extensions.dart';

class MovieScores extends StatefulWidget {
  final MovieDetailEntity movieDetailEntry;

  MovieScores({@required this.movieDetailEntry, Key key}) : super(key: key);

  @override
  _MovieScores createState() => _MovieScores();
}

class _MovieScores extends State<MovieScores> {
  Future<Widget> _widget;

  @override
  void initState() {
    super.initState();
    _widget = loadWidget();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _widget,
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.hasData) {
          return snapshot.data;
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  Future<Widget> loadWidget() async {
    GetTomatoScores getTomatoScores = getItInstance<GetTomatoScores>();
    final widgetEither = await getTomatoScores(MovieParamsWithTitle(
        widget.movieDetailEntry.id, widget.movieDetailEntry.title));
    return widgetEither.fold((l) {
      return SizedBox.shrink();
    }, (r) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "IMDB: ${widget.movieDetailEntry.voteAverage.convertToPercentageString()}",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "Tomato Score: ${r.tomatometerScore.toString()} %",
            style: TextStyle(fontSize: 12),
          ),
          Text(
            "Audience Score: ${r.audienceScore.toString()} %",
            style: TextStyle(fontSize: 12),
          ),
        ],
      );
    });
  }
}
