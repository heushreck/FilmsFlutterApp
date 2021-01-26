import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FilmsFlutterApp/common/constants/size_constants.dart';
import 'package:FilmsFlutterApp/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:FilmsFlutterApp/presentation/journeys/search_movie/search_movie_card.dart';
import 'package:FilmsFlutterApp/presentation/themes/theme_color.dart';
import 'package:FilmsFlutterApp/presentation/themes/theme_text.dart';
import 'package:FilmsFlutterApp/common/extensions/size_extensions.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMovieBloc searchMovieBloc;

  CustomSearchDelegate(this.searchMovieBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.greySubtitle1,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
        ),
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: Sizes.dimen_12.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(
      SearchTermChangedEvent(query),
    );

    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      cubit: searchMovieBloc,
      builder: (context, state) {
        if (state is SearchMovieError) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64.w),
              child: Text(
                "There was an error",
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else if (state is SearchMovieLoaded) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64.w),
                child: Text(
                  "No movies found",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => SearchMovieCard(
              movie: movies[index],
            ),
            itemCount: movies.length,
            scrollDirection: Axis.vertical,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}