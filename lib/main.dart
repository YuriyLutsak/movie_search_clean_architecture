import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_search/dependency_injection.dart';
import 'package:movie_search/domain/entity/hive/movie_hive/movie_hive.dart';

import 'movie_serch_app.dart';

void main() async {
  Hive.registerAdapter(MovieHiveAdapter());
  setup();
  runApp(MyApp());
}
