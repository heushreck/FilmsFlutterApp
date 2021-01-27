import 'package:FilmsFlutterApp/data/core/api_constants.dart';
import 'package:FilmsFlutterApp/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:FilmsFlutterApp/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:FilmsFlutterApp/common/constants/size_constants.dart';
import 'package:FilmsFlutterApp/common/extensions/size_extensions.dart';
import 'package:FilmsFlutterApp/common/extensions/string_extensions.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title, posterPath;

  const MovieTabCardWidget({
    Key key,
    @required this.movieId,
    @required this.title,
    @required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String heroTag = "movie_tab_";
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailArguments:
                  MovieDetailArguments(movieId, posterPath, title),
              heroTag: heroTag,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
              child: Hero(
                tag: "$heroTag$movieId",
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      new Image.asset("assets/pngs/movie.png"),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_4.h),
            child: Text(
              title.intelliTrim(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
