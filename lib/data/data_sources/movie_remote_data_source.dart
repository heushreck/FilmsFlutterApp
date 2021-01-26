import 'package:FilmsFlutterApp/data/core/api_client.dart';
import 'package:FilmsFlutterApp/data/models/cast_crew_result_data_model.dart';
import 'package:FilmsFlutterApp/data/models/movie_detail_model.dart';
import 'package:FilmsFlutterApp/data/models/movie_model.dart';
import 'package:FilmsFlutterApp/data/models/movie_result_model.dart';
import 'package:FilmsFlutterApp/data/models/video_model.dart';
import 'package:FilmsFlutterApp/data/models/video_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<CastModel>> getCastCrew(int id);
  Future<List<VideoModel>> getVideos(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final responseBody = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final responseBody = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final responseBody = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final responseBody = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(responseBody).movies;
    print(movies);
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    print(movie);
    return movie;
  }

  Future<List<CastModel>> getCastCrew(int id) async {
    final response = await _client.get('movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(response).cast;
    print(cast);
    return cast;
  }

  Future<List<VideoModel>> getVideos(int id) async {
    final response = await _client.get('movie/$id/videos');
    final videos = VideoResultModel.fromJson(response).videos;
    print(videos);
    return videos;
  }
}
