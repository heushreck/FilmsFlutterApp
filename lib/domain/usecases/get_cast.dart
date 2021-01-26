import 'package:FilmsFlutterApp/domain/entities/app_error.dart';
import 'package:FilmsFlutterApp/domain/entities/cast_entity.dart';
import 'package:FilmsFlutterApp/domain/entities/movie_params.dart';
import 'package:FilmsFlutterApp/domain/repositories/movie_repository.dart';
import 'package:FilmsFlutterApp/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCast extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository repository;

  GetCast(this.repository);

  Future<Either<AppError, List<CastEntity>>> call(
      MovieParams movieParams) async {
    return await repository.getCastCrew(movieParams.id);
  }
}
