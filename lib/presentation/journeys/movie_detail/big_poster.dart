import 'package:FilmsFlutterApp/presentation/journeys/movie_detail/movie_scores.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:FilmsFlutterApp/common/screenutil/screenutil.dart';
import 'package:FilmsFlutterApp/presentation/themes/theme_text.dart';
import 'package:FilmsFlutterApp/data/core/api_constants.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_detail_entity.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;
  final String heroTag;

  const BigPoster({
    Key key,
    @required this.movie,
    @required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: Hero(
            tag: "$heroTag${movie.id}",
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
              width: ScreenUtil.screenWidth,
              errorWidget: (context, url, error) =>
                  new Image.asset("assets/pngs/movie.png"),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              movie.releaseDate,
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: MovieScores(
              movieDetailEntry: movie,
            ),
          ),
        ),
      ],
    );
  }
}
