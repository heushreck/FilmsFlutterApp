import 'package:flutter/material.dart';
import 'package:FilmsFlutterApp/common/constants/size_constants.dart';
import 'package:FilmsFlutterApp/common/extensions/size_extensions.dart';
import 'package:FilmsFlutterApp/presentation/themes/theme_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Button({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_20.w),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: Sizes.dimen_16.h,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
