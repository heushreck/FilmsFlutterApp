import 'dart:async';

import 'package:FilmsFlutterApp/domain/entities/app_error.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_detail_entity.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_params.dart';
import 'package:FilmsFlutterApp/domain/usecases/get_movie_detail.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;

  MovieDetailBloc({
    @required this.getMovieDetail,
  }) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(
    MovieDetailEvent event,
  ) async* {
    if (event is MovieDetailLoadEvent) {
      yield MovieDetailLoading();
      final Either<AppError, MovieDetailEntity> eitherResponse =
          await getMovieDetail(
        MovieParams(event.movieId),
      );

      yield eitherResponse.fold(
        (l) => MovieDetailError(),
        (r) => MovieDetailLoaded(r),
      );
    }
  }
}
