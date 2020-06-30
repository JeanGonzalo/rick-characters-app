import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ponte_rikoso/src/ui/screens/pager_screen.dart';
import 'package:ponte_rikoso/src/ui/screens/tab1_screen.dart';
import 'package:ponte_rikoso/src/ui/screens/tab2_screen.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PagerScreen.routeName:
      return buildRoute(settings, PagerScreen());
    case Tab1Screen.routeName:
      return buildRoute(settings, Tab1Screen());
    case Tab2Screen.routeName:
      return buildRoute(settings, Tab2Screen());
    default:
      return buildRoute(settings, PagerScreen());
  }
}

MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(
    builder: (BuildContext context) => builder,
    settings: settings,
    fullscreenDialog: false,
    maintainState: false,
  );
}
