import 'package:FilmsFlutterApp/domain/entities/app_error.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_detail_entity.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_params.dart';
import 'package:FilmsFlutterApp/domain/repositories/movie_repository.dart';
import 'package:FilmsFlutterApp/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
