import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:FilmsFlutterApp/domain/entities/app_error.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_entity.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_search_params.dart';
import 'package:FilmsFlutterApp/domain/usecases/search_movies.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;

  SearchMovieBloc({
    @required this.searchMovies,
  }) : super(SearchMovieInitial());

  @override
  Stream<SearchMovieState> mapEventToState(
    SearchMovieEvent event,
  ) async* {
    if (event is SearchTermChangedEvent) {
      if (event.searchTerm.length > 2) {
        yield SearchMovieLoading();
        final Either<AppError, List<MovieEntity>> response =
            await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));
        yield response.fold(
          (l) => SearchMovieError(),
          (r) => SearchMovieLoaded(r),
        );
      }
    } else if (event is SearchGetSuggestedEvent) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> suggested = prefs.getStringList("suggested") ?? [];
      yield SearchSuggestedLoaded(suggested);
    }
  }
}
