import 'package:FilmsFlutterApp/common/constants/size_constants.dart';
import 'package:FilmsFlutterApp/common/extensions/size_extensions.dart';
import 'package:FilmsFlutterApp/data/core/api_constants.dart';
import 'package:FilmsFlutterApp/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:FilmsFlutterApp/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  final String title;

  const MovieCardWidget({
    Key key,
    @required this.movieId,
    @required this.posterPath,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String heroTag = "movie_carousel_";
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      child: GestureDetector(
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
    );
  }
}
