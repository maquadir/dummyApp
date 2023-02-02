import 'package:app/screens/details_screen/details_screen.dart';
import 'package:app/theme/amaysim_theme.dart';
import 'package:app/screens/home_screen/home_screen.dart';
import 'package:app/util/routes.dart';
import 'package:flutter/material.dart';

// Entry point
void main() async {
  runApp(
    MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: AmaysimTheme.themeData(),
      initialRoute: Routes.home,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        Routes.home: (context) => const HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        Routes.details: (context) => const DetailsScreen(),
      },
    ),
  );
}
