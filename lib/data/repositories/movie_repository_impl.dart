import 'package:FilmsFlutterApp/data/data_sources/movie_remote_data_source.dart';
import 'package:FilmsFlutterApp/data/models/cast_crew_result_data_model.dart';
import 'package:FilmsFlutterApp/data/models/movie_detail_model.dart';
import 'package:FilmsFlutterApp/data/models/movie_model.dart';
import 'package:FilmsFlutterApp/domain/entities/app_error.dart';
import 'package:FilmsFlutterApp/domain/entities/video_entity.dart';
import 'package:FilmsFlutterApp/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(id);
      return Right(movie);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<CastModel>>> getCastCrew(int id) async {
    try {
      final castCrew = await remoteDataSource.getCastCrew(id);
      return Right(castCrew);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<VideoEntity>>> getVideos(int id) async {
    try {
      final videos = await remoteDataSource.getVideos(id);
      return Right(videos);
    } on Exception {
      return Left(AppError("Something went wrong"));
    }
  }
}
