import 'package:FilmsFlutterApp/presentation/blocs/movie_tabed/movie_tabbed_bloc.dart';
import 'package:FilmsFlutterApp/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FilmsFlutterApp/common/constants/size_constants.dart';
import 'package:FilmsFlutterApp/common/extensions/size_extensions.dart';

import 'movie_list_view_builder.dart';
import 'movie_tabbed_constants.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex = 0;

  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0;
                      i < MovieTabbedConstants.movieTabs.length;
                      i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.movieTabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabbedConstants.movieTabs[i].index ==
                          state.currentTabIndex,
                    )
                ],
              ),
              if (state is MovieTabChanged)
                Expanded(
                  child: MovieListViewBuilder(
                    movies: state.movies,
                    scrollController: _controller,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    _controller.jumpTo(0);
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
