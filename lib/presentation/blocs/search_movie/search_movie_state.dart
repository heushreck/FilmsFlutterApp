part of 'search_movie_bloc.dart';

abstract class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoaded extends SearchMovieState {
  final List<MovieEntity> movies;

  SearchMovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchSuggestedLoaded extends SearchMovieState {
  final List<String> suggested;

  SearchSuggestedLoaded(this.suggested);

  @override
  List<Object> get props => [suggested];
}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieError extends SearchMovieState {}
