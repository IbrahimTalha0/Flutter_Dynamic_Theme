// @dart=2.9

import 'package:dynamic_theme_and_language/core/provider/theme_notifier.dart';
import 'package:dynamic_theme_and_language/pages/home.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() {

    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(Colors.blue), //kayıtlı olan rengi uygula
        child: MyApp(),
      ),
    );
  }


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}
