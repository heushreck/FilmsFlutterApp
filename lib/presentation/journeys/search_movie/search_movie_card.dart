import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:FilmsFlutterApp/common/constants/size_constants.dart';
import 'package:FilmsFlutterApp/data/core/api_constants.dart';
import 'package:FilmsFlutterApp/common/extensions/size_extensions.dart';
import 'package:FilmsFlutterApp/presentation/themes/theme_text.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_entity.dart';
import 'package:FilmsFlutterApp/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:FilmsFlutterApp/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;
  final String query;

  const SearchMovieCard({
    Key key,
    @required this.movie,
    @required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String heroTag = "movie_search_";
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> suggested = prefs.getStringList("suggested") ?? [];
        suggested.remove(query);
        suggested.add(query);
        prefs.setStringList("suggested", suggested);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailArguments:
                  MovieDetailArguments(movie.id, movie.posterPath, movie.title),
              heroTag: heroTag,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
          vertical: Sizes.dimen_2.h,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
                child: Hero(
                  tag: "$heroTag${movie.id}",
                  child: CachedNetworkImage(
                    imageUrl:
                        '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                    width: Sizes.dimen_80.w,
                    errorWidget: (context, url, error) =>
                        new Image.asset("assets/pngs/movie.png"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    movie.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
