import 'package:FilmsFlutterApp/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:FilmsFlutterApp/presentation/journeys/favorite/favorite_screen.dart';
import 'package:FilmsFlutterApp/presentation/journeys/search_movie/custom_search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants/size_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../../common/screenutil/screenutil.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.list,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            ),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                      BlocProvider.of<SearchMovieBloc>(context)));
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            ),
          ),
        ],
      ),
    );
  }
}
