import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FilmsFlutterApp/presentation/blocs/videos/videos_bloc.dart';
import 'package:FilmsFlutterApp/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:FilmsFlutterApp/presentation/journeys/watch_video/watch_video_screen.dart';
import 'package:FilmsFlutterApp/presentation/widgets/button.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;

  const VideosWidget({
    Key key,
    this.videosBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: videosBloc,
      builder: (context, state) {
        if (state is VideosLoaded && state.videos.iterator.moveNext()) {
          final _videos = state.videos;
          return Button(
            text: "Watch Trailer",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WatchVideoScreen(
                    watchVideoArguments: WatchVideoArguments(_videos),
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
