import 'package:FilmsFlutterApp/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:FilmsFlutterApp/domain/entities/app_error.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_entity.dart';
import 'package:FilmsFlutterApp/domain/entities/no_params.dart';
import 'package:FilmsFlutterApp/domain/repositories/movie_repository.dart';

class GetFavoriteMovies extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetFavoriteMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getFavoriteMovies();
  }
}
