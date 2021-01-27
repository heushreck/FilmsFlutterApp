part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class MovieDetailLoadEvent extends MovieDetailEvent {
  final int movieId;
  final String title;

  const MovieDetailLoadEvent(this.movieId, this.title);

  @override
  List<Object> get props => [movieId];
}
