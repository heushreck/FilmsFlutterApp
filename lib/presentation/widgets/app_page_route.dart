import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// Offset from offscreen below to fully on screen.
class AppPageRoute extends MaterialPageRoute<String> {
  @override
  final bool maintainState;

  @override
  final WidgetBuilder builder;

  AppPageRoute({
    @required this.builder,
    RouteSettings settings: const RouteSettings(),
    this.maintainState: true,
    bool fullscreenDialog: false,
  })  : assert(builder != null),
        assert(settings != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(
          settings: settings,
          fullscreenDialog: fullscreenDialog,
          builder: builder,
        ) {
    assert(opaque); // PageRoute makes it return true.
  }

  @override
  Color get barrierColor => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final Widget result = builder(context);
    assert(() {
      if (result == null) {
        throw new FlutterError(
            'The builder for route "${settings.name}" returned null.\n'
            'Route builders must never return null.');
      }
      return true;
    }());
    return result;
  }
}
