import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_search/dependency_injection.dart';
import 'package:movie_search/domain/entity/hive/movie_hive/movie_hive.dart';
import 'package:path_provider/path_provider.dart';

import 'movie_serch_app.dart'; // Для получения пути к документам

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path); // Инициализация Hive с указанием пути

  Hive.registerAdapter(MovieHiveAdapter()); // Регистрация адаптера
  setup();

  runApp(MyApp());
}
