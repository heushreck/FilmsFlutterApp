import 'package:FilmsFlutterApp/domain/usecases/usecase.dart';
import 'package:FilmsFlutterApp/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_entity.dart';
import 'package:FilmsFlutterApp/domain/repositories/movie_repository.dart';

class SaveMovie extends UseCase<void, MovieEntity> {
  final MovieRepository movieRepository;

  SaveMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieEntity params) async {
    return await movieRepository.saveMovie(params);
  }
}
