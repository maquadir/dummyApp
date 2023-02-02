

import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    title: Text('amaysim Take Home'),
    titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
  );
}