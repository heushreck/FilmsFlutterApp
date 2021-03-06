import 'package:FilmsFlutterApp/common/screenutil/screenutil.dart';
import 'package:FilmsFlutterApp/presentation/journeys/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'themes/theme_color.dart';
import 'themes/theme_text.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filme App',
      theme: ThemeData(
        unselectedWidgetColor: Colors.grey,
        primaryColor: AppColor.darkgrey,
        accentColor: AppColor.yellow,
        scaffoldBackgroundColor: AppColor.darkgrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(),
    );
  }
}
