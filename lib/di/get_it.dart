import 'package:FilmsFlutterApp/data/core/api_client.dart';
import 'package:FilmsFlutterApp/data/data_sources/movie_local_data_source.dart';
import 'package:FilmsFlutterApp/data/data_sources/movie_remote_data_source.dart';
import 'package:FilmsFlutterApp/data/repositories/movie_repository_impl.dart';
import 'package:FilmsFlutterApp/domain/repositories/movie_repository.dart';
import 'package:FilmsFlutterApp/domain/usecases/check_if_movie_favorite.dart';
import 'package:FilmsFlutterApp/domain/usecases/delete_favorite_movie.dart';
import 'package:FilmsFlutterApp/domain/usecases/get_cast.dart';
import 'package:FilmsFlutterApp/domain/usecases/get_coming_soon.dart';
import 'package:FilmsFlutterApp/domain/usecases/get_favorite_movies.dart';
import 'package:FilmsFlutterApp/domain/usecases/get_movie_detail.dart';
import 'package:FilmsFlutterApp/domain/usecases/get_playing_now.dart';
import 'package:FilmsFlutterApp/domain/usecases/get_popular.dart';
import 'package:FilmsFlutterApp/domain/usecases/get_tomato_scores.dart';
import 'package:FilmsFlutterApp/domain/usecases/get_trending.dart';
import 'package:FilmsFlutterApp/domain/usecases/get_videos.dart';
import 'package:FilmsFlutterApp/domain/usecases/save_movie.dart';
import 'package:FilmsFlutterApp/domain/usecases/search_movies.dart';
import 'package:FilmsFlutterApp/presentation/blocs/cast/cast_bloc.dart';
import 'package:FilmsFlutterApp/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:FilmsFlutterApp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:FilmsFlutterApp/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:FilmsFlutterApp/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:FilmsFlutterApp/presentation/blocs/movie_tabed/movie_tabbed_bloc.dart';
import 'package:FilmsFlutterApp/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:FilmsFlutterApp/presentation/blocs/videos/videos_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  // all dependencies goes here
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());

  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));

  getItInstance
      .registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
            getItInstance(),
            getItInstance(),
          ));

  getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));

  getItInstance
      .registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));

  getItInstance
      .registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));

  getItInstance
      .registerLazySingleton<SaveMovie>(() => SaveMovie(getItInstance()));

  getItInstance.registerLazySingleton<GetFavoriteMovies>(
      () => GetFavoriteMovies(getItInstance()));

  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
      () => DeleteFavoriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<CheckIfFavoriteMovie>(
      () => CheckIfFavoriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<GetTomatoScores>(
      () => GetTomatoScores(getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(() => MovieCarouselBloc(
      getTrending: getItInstance(), movieBackdropBloc: getItInstance()));

  getItInstance.registerFactory(
    () => CastBloc(
      getCast: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => VideosBloc(
      getVideos: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieTabbedBloc(
      getPopular: getItInstance(),
      getComingSoon: getItInstance(),
      getPlayingNow: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      videosBloc: getItInstance(),
      favoriteBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => SearchMovieBloc(
      searchMovies: getItInstance(),
    ),
  );

  getItInstance.registerFactory(() => FavoriteBloc(
        saveMovie: getItInstance(),
        checkIfFavoriteMovie: getItInstance(),
        deleteFavoriteMovie: getItInstance(),
        getFavoriteMovies: getItInstance(),
      ));
}
