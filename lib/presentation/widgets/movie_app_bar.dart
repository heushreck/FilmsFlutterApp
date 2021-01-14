import 'package:flutter/material.dart';

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
            onPressed: () {},
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
