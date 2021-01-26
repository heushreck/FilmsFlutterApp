import 'package:FilmsFlutterApp/common/constants/size_constants.dart';
import 'package:FilmsFlutterApp/common/extensions/size_extensions.dart';
import 'package:FilmsFlutterApp/common/screenutil/screenutil.dart';
import 'package:FilmsFlutterApp/di/get_it.dart';
import 'package:FilmsFlutterApp/presentation/blocs/cast/cast_bloc.dart';
import 'package:FilmsFlutterApp/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:FilmsFlutterApp/presentation/blocs/videos/videos_bloc.dart';
import 'package:FilmsFlutterApp/presentation/journeys/movie_detail/cast_widget.dart';
import 'package:FilmsFlutterApp/presentation/journeys/movie_detail/videos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'big_poster.dart';
import 'movie_detail_app_bar.dart';
import 'movie_detail_arguments.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    Key key,
    @required this.movieDetailArguments,
  })  : assert(movieDetailArguments != null, 'arguments must not be null'),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailBloc _movieDetailBloc;
  CastBloc _castBloc;
  VideosBloc _videosBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _videosBloc = _movieDetailBloc.videosBloc;
    _movieDetailBloc.add(
      MovieDetailLoadEvent(
        widget.movieDetailArguments.movieId,
      ),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    _castBloc?.close();
    _videosBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _castBloc),
          BlocProvider.value(value: _videosBloc),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return Stack(children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BigPoster(
                        movie: movieDetail,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_16.w,
                          vertical: Sizes.dimen_8.h,
                        ),
                        child: Text(
                          movieDetail.overview,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                        child: Text(
                          "Cast",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      CastWidget(),
                      VideosWidget(videosBloc: _videosBloc),
                    ],
                  ),
                ),
                Positioned(
                  left: Sizes.dimen_16.w,
                  right: Sizes.dimen_16.w,
                  top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
                  child: MovieDetailAppBar(),
                ),
              ]);
            } else if (state is MovieDetailError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
