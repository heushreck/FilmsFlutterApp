import 'package:FilmsFlutterApp/data/models/movie_detail_model.dart';
import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final num voteAverage;
  final String backdropPath;
  final String posterPath;
  final int budget;
  final List<Genres> genres;
  final int revenue;

  const MovieDetailEntity({
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.voteAverage,
    this.backdropPath,
    this.posterPath,
    this.budget,
    this.genres,
    this.revenue,
  });

  @override
  List<Object> get props => [id];
}
