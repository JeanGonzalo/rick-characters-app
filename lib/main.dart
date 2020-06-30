import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ponte_rikoso/src/providers/rick_character_bloc.dart';
import 'package:provider/provider.dart';

import 'package:ponte_rikoso/src/ui/shared/theme.dart';
import 'package:ponte_rikoso/src/configurations/routes.dart';
import 'package:ponte_rikoso/src/ui/screens/pager_screen.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  // ErrorWidget.builder = (FlutterErrorDetails details) => CustomErrorWidget();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => RickCharacterBloc()..retrieveCharacter()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: myTheme,
        //home: PagerScreen(),
        onGenerateRoute: generateRoute,
        initialRoute: PagerScreen.routeName,
      ),
    );
  }
}
