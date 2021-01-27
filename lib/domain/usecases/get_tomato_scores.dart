import 'package:FilmsFlutterApp/data/models/tomate_model.dart';
import 'package:FilmsFlutterApp/domain/entities/app_error.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_params_with_title.dart';
import 'package:FilmsFlutterApp/domain/repositories/movie_repository.dart';
import 'package:FilmsFlutterApp/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetTomatoScores extends UseCase<TomatoModel, MovieParamsWithTitle> {
  final MovieRepository repository;

  GetTomatoScores(this.repository);

  @override
  Future<Either<AppError, TomatoModel>> call(
      MovieParamsWithTitle movieParams) async {
    return await repository.getTomatoScroes(movieParams.title);
  }
}
