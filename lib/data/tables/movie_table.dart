import 'package:hive/hive.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_entity.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  @HiveField(3)
  final int myRating;

  MovieTable({this.id, this.title, this.posterPath, this.myRating})
      : super(
          id: id,
          title: title,
          posterPath: posterPath,
          backdropPath: '',
          releaseDate: '',
          voteAverage: 0,
          myRating: myRating,
        );

  factory MovieTable.fromMovieEntity(MovieEntity movieEntity) {
    return MovieTable(
      id: movieEntity.id,
      title: movieEntity.title,
      posterPath: movieEntity.posterPath,
      myRating: movieEntity.myRating,
    );
  }
}
